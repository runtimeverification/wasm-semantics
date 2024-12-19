#!/usr/bin/python3
import sys
from pathlib import Path

from eth_account import Account
from requests.exceptions import ConnectionError
from web3 import Web3

# from web3.middleware import SignAndSendRawMiddlewareBuilder


def fund_acct(w3, addr):
    try:
        fund_tx_hash = w3.eth.send_transaction({'from': w3.eth.accounts[0], 'to': addr, 'value': 1000000000000000000})
        fund_tx_receipt = w3.eth.wait_for_transaction_receipt(fund_tx_hash)
    except ConnectionError:
        print('Failed to connect to node', file=sys.stderr)
        sys.exit(1)
    return fund_tx_receipt


USAGE = 'fund_acct.py <address_or_pk_file> [node_url]'


def main():
    # check arg count
    args = sys.argv[1:]
    if len(args) < 1 or len(args) > 2:
        print(USAGE, file=sys.stderr)
        sys.exit(1)

    # parse args
    addr_or_pkfile = args[0]
    if not Web3.is_address(addr_or_pkfile):
        pk = bytes.fromhex(Path(addr_or_pkfile).read_text().strip().removeprefix('0x'))
        addr = Account.from_key(pk).address
    else:
        addr = addr_or_pkfile
    node_url = 'http://localhost:8545'
    if len(args) > 1:
        node_url = args[1]

    # fund acct
    w3 = Web3(Web3.HTTPProvider(node_url))
    fund_receipt = fund_acct(w3, addr)

    # return exit code based on status which is 1 for confirmed and 0 for reverted
    success = bool(fund_receipt['status'])

    # print receipt on failure
    if not success:
        print(fund_receipt)

    # set exit code
    sys.exit(int(not success))


if __name__ == '__main__':
    main()
