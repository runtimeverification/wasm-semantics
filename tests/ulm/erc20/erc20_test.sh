#!/bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$SCRIPT_DIR/../../.."

# change to root directory
cd "$ROOT_DIR"

# re-execute script with poetry to get poetry script aliases
if [ -z ${IN_POETRY_SHELL:+x} ]; then
  export IN_POETRY_SHELL=1
  exec poetry -C pykwasm run bash "$SCRIPT_DIR/$(basename -- $0)"
fi


RED='\033[0;31m'
NC='\033[0m'
GREEN="\033[0;32m"
BLUE="\033[0;34m"
WHITE="\033[0;00m"

function assert_eq {
  if [ ! "$1" == "$2" ]; then
    >&2 echo -e "${RED}$3${NC}: Expected $1 to be equal to $2"
    exit 1
  fi
}

function to_hex {
  printf "0x%x" $1
}

function erc20_deploy {
  local key=$1
  deploy build/erc20/erc20.bin http://localhost:8545 /dev/stdin <<< $key
}

function erc20_decimals {
  local key=$1
  local contract=$2
  call http://localhost:8545 erc20 $contract /dev/stdin 0 decimals <<< $key
}

function erc20_totalSupply {
  local key=$1
  local contract=$2
  call http://localhost:8545 erc20 $contract /dev/stdin 0 totalSupply <<< $key
}

function erc20_balanceOf {
  local key=$1
  local contract=$2
  local account=$3
  call http://localhost:8545 erc20 $contract /dev/stdin 0 balanceOf $account <<< $key
}

function erc20_allowance {
  local key=$1
  local contract=$2
  local from_account=$3
  local allowed_account=$4
  call http://localhost:8545 erc20 $contract /dev/stdin 0 allowance $from_account $allowed_account <<< $key
}

function erc20_mint {
  local key=$1
  local contract=$2
  local account=$3
  local amount=$4
  call http://localhost:8545 erc20 $contract /dev/stdin 0 mint $account $amount <<< $key
}

function erc20_transfer {
  local key=$1
  local contract=$2
  local account=$3
  local amount=$4
  call http://localhost:8545 erc20 $contract /dev/stdin 0 transfer $account $amount <<< $key
}

function erc20_approve {
  local key=$1
  local contract=$2
  local account=$3
  local amount=$4
  call http://localhost:8545 erc20 $contract /dev/stdin 0 approve $account $amount <<< $key
}

function erc20_transfer_from {
  local key=$1
  local contract=$2
  local from_account=$3
  local to_account=$4
  local amount=$5
  call http://localhost:8545 erc20 $contract /dev/stdin 0 transferFrom $from_account $to_account $amount <<< $key
}

function test_decimals {
  echo -n "Decimals test "

  # generate some accounts
  account1=($(mkacct))
  a1=${account1[0]}
  k1=${account1[1]}
  echo -n "."

  # fund accounts
  fund /dev/stdin <<< $k1
  echo -n "."

  # deploy contract
  contract=$(erc20_deploy $k1)
  echo -n "."

  decimals=$(erc20_decimals $k1 $contract)
  echo -n "."
  assert_eq "18" "$decimals" "Decimals"

  echo -e " ${GREEN}passed${NC}"
}

function test_mint {
  echo -n "Mint test "

  # generate some accounts
  account1=($(mkacct))
  a1=${account1[0]}
  k1=${account1[1]}
  echo -n "."

  account2=($(mkacct))
  a2=${account2[0]}
  k2=${account2[1]}
  echo -n "."

  account3=($(mkacct))
  a3=${account3[0]}
  k3=${account3[1]}
  echo -n "."

  # fund accounts
  fund /dev/stdin <<< $k1
  echo -n "."
  fund /dev/stdin <<< $k2
  echo -n "."
  fund /dev/stdin <<< $k3
  echo -n "."

  # deploy contract
  contract=$(erc20_deploy $k1)
  echo -n "."

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "0" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "0" "$supply" "Total Supply"

  erc20_mint $k1 $contract $a2 $(to_hex 1000)
  echo -n "."

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "1000" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  erc20_mint $k1 $contract $a3 $(to_hex 2000)
  echo -n "."

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "1000" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "2000" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "3000" "$supply" "Total Supply"

  echo -e " ${GREEN}passed${NC}"
}

function test_transfer {
  echo -n "Transfer test "

  # generate some accounts
  account1=($(mkacct))
  a1=${account1[0]}
  k1=${account1[1]}
  echo -n "."

  account2=($(mkacct))
  a2=${account2[0]}
  k2=${account2[1]}
  echo -n "."

  account3=($(mkacct))
  a3=${account3[0]}
  k3=${account3[1]}
  echo -n "."

  # fund accounts
  fund /dev/stdin <<< $k1
  echo -n "."
  fund /dev/stdin <<< $k2
  echo -n "."
  fund /dev/stdin <<< $k3
  echo -n "."

  # deploy contract
  contract=$(erc20_deploy $k1)
  echo -n "."

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "0" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "0" "$supply" "Total Supply"

  erc20_mint $k1 $contract $a2 $(to_hex 1000)
  echo -n "."

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "1000" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  erc20_transfer $k2 $contract $a3 $(to_hex 200)
  echo -n "."

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "800" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "200" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  echo -e " ${GREEN}passed${NC}"
}

function test_transfer_from {
  echo -n "Transfer from test "

  # generate some accounts
  account1=($(mkacct))
  a1=${account1[0]}
  k1=${account1[1]}
  echo -n "."

  account2=($(mkacct))
  a2=${account2[0]}
  k2=${account2[1]}
  echo -n "."

  account3=($(mkacct))
  a3=${account3[0]}
  k3=${account3[1]}
  echo -n "."

  account4=($(mkacct))
  a4=${account4[0]}
  k4=${account4[1]}
  echo -n "."

  # fund accounts
  fund /dev/stdin <<< $k1
  echo -n "."
  fund /dev/stdin <<< $k2
  echo -n "."
  fund /dev/stdin <<< $k3
  echo -n "."
  fund /dev/stdin <<< $k4
  echo -n "."

  # deploy contract
  contract=$(erc20_deploy $k1)
  echo -n "."

  # ***** Check initial state

  balance=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 2"

  balance=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 3"

  balance=$(erc20_balanceOf $k1 $contract $a4)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 4"

  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "0" "$supply" "Total Supply"

  allowance=$(erc20_allowance $k1 $contract $a2 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 3"

  allowance=$(erc20_allowance $k1 $contract $a2 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a3 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a3 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a4 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a4 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 3"

  # ***** Mint tokens

  erc20_mint $k1 $contract $a2 $(to_hex 1000)
  echo -n "."

  # ***** Check state after mint

  balance=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "1000" "$balance" "Balance of Account 2"

  balance=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 3"

  balance=$(erc20_balanceOf $k1 $contract $a4)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 4"

  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  allowance=$(erc20_allowance $k1 $contract $a2 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 3"

  allowance=$(erc20_allowance $k1 $contract $a2 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a3 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a3 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a4 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a4 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 3"

  # ***** Account 2 approves Account 3 to transfer 300 tokens

  erc20_approve $k2 $contract $a3 $(to_hex 300)
  echo -n "."

  # ***** Check state after approve

  balance=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "1000" "$balance" "Balance of Account 2"

  balance=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 3"

  balance=$(erc20_balanceOf $k1 $contract $a4)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 4"

  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  allowance=$(erc20_allowance $k1 $contract $a2 $a3)
  echo -n "."
  assert_eq "300" "$allowance" "Allowance from Account 2 to Account 3"

  allowance=$(erc20_allowance $k1 $contract $a2 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a3 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a3 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a4 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a4 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 3"

  # ***** Account 3 transfers 200 tokens from Account 2 to Account 4

  erc20_transfer_from $k3 $contract $a2 $a4 $(to_hex 200)
  echo -n "."

  # ***** Check state after transfer

  balance=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "800" "$balance" "Balance of Account 2"

  balance=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "0" "$balance" "Balance of Account 3"

  balance=$(erc20_balanceOf $k1 $contract $a4)
  echo -n "."
  assert_eq "200" "$balance" "Balance of Account 4"

  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  allowance=$(erc20_allowance $k1 $contract $a2 $a3)
  echo -n "."
  assert_eq "100" "$allowance" "Allowance from Account 2 to Account 3"

  allowance=$(erc20_allowance $k1 $contract $a2 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a3 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a3 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a4 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a4 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 3"

  # ***** Account 3 transfers 100 tokens from Account 2 to Account 3

  erc20_transfer_from $k3 $contract $a2 $a3 $(to_hex 100)
  echo -n "."

  # ***** Check state after transfer

  balance=$(erc20_balanceOf $k1 $contract $a2)
  echo -n "."
  assert_eq "700" "$balance" "Balance of Account 2"

  balance=$(erc20_balanceOf $k1 $contract $a3)
  echo -n "."
  assert_eq "100" "$balance" "Balance of Account 3"

  balance=$(erc20_balanceOf $k1 $contract $a4)
  echo -n "."
  assert_eq "200" "$balance" "Balance of Account 4"

  supply=$(erc20_totalSupply $k1 $contract)
  echo -n "."
  assert_eq "1000" "$supply" "Total Supply"

  allowance=$(erc20_allowance $k1 $contract $a2 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 3"

  allowance=$(erc20_allowance $k1 $contract $a2 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 2 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a3 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a3 $a4)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 3 to Account 4"

  allowance=$(erc20_allowance $k1 $contract $a4 $a2)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 2"

  allowance=$(erc20_allowance $k1 $contract $a4 $a3)
  echo -n "."
  assert_eq "0" "$allowance" "Allowance from Account 4 to Account 3"

  echo -e " ${GREEN}passed${NC}"
}


test_decimals
test_mint
test_transfer
test_transfer_from

echo -e "${GREEN}All tests passed${NC}"
