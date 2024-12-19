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

function erc20_mint {
  local key=$1
  local contract=$2
  local account=$3
  local amount=$4
  call http://localhost:8545 erc20 $contract /dev/stdin 0 mint $account $amount <<< $key
}

function test_decimals {
  echo "Decimals test"

  # generate some accounts
  account1=($(mkacct))
  a1=${account1[0]}
  k1=${account1[1]}
  echo "Account 1. address: $a1; key: $k1"

  # fund accounts
  fund /dev/stdin <<< $k1

  # deploy contract
  contract=$(erc20_deploy $k1)
  echo "Contract deployed. Contract address: $contract"

  decimals=$(erc20_decimals $k1 $contract)
  assert_eq "18" "$decimals" "Decimals"
}

function test_mint {
  echo "Mint test"

  # generate some accounts
  account1=($(mkacct))
  a1=${account1[0]}
  k1=${account1[1]}
  echo "Account 1. address: $a1; key: $k1"

  account2=($(mkacct))
  a2=${account2[0]}
  k2=${account2[1]}
  echo "Account 2. address: $a2; key: $k2"

  account3=($(mkacct))
  a3=${account3[0]}
  k3=${account3[1]}
  echo "Account 3. address: $a3; key: $k3"

  # fund accounts
  fund /dev/stdin <<< $k1
  fund /dev/stdin <<< $k2
  fund /dev/stdin <<< $k3

  # deploy contract
  contract=$(erc20_deploy $k1)
  echo "Contract deployed. Contract address: $contract"

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  assert_eq "0" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  assert_eq "0" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  assert_eq "0" "$supply" "Total Supply"

  erc20_mint $k1 $contract $a2 $(to_hex 1000)

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  assert_eq "1000" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  assert_eq "0" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  assert_eq "1000" "$supply" "Total Supply"

  erc20_mint $k1 $contract $a3 $(to_hex 2000)

  balance2=$(erc20_balanceOf $k1 $contract $a2)
  assert_eq "1000" "$balance2" "Balance of Account 2"

  balance3=$(erc20_balanceOf $k1 $contract $a3)
  assert_eq "2000" "$balance3" "Balance of Account 3"

  # check total supply
  supply=$(erc20_totalSupply $k1 $contract)
  assert_eq "3000" "$supply" "Total Supply"
}

test_decimals

test_mint

echo -e "${GREEN}All tests passed${NC}"
