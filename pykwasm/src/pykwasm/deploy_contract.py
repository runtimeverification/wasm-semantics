#!/usr/bin/python3
import sys
from pathlib import Path

from eth_account import Account
from web3 import Web3
from web3.middleware import SignAndSendRawMiddlewareBuilder


def deploy_contract(node_url, sender, contract_hex):
    w3 = Web3(Web3.HTTPProvider(node_url))
    if sender is None:
        sender = w3.eth.account.create()
    # fund sender acct
    fund_tx_hash = w3.eth.send_transaction(
        {'from': w3.eth.accounts[0], 'to': sender.address, 'value': 1000000000000000000}
    )
    fund_tx_receipt = w3.eth.wait_for_transaction_receipt(fund_tx_hash)
    w3.middleware_onion.inject(SignAndSendRawMiddlewareBuilder.build(sender), layer=0)
    # deploy txn
    deploy_token_tx = {
        'from': sender.address,
        'data': contract_hex,
        'to': '',
        'value': 0,
        'gas': 11000000,
        'maxFeePerGas': 2000000000,
        'maxPriorityFeePerGas': 1000000000,
    }
    deploy_tx_hash = w3.eth.send_transaction(deploy_token_tx)
    deploy_tx_receipt = w3.eth.wait_for_transaction_receipt(deploy_tx_hash)
    return fund_tx_receipt, deploy_tx_receipt


USAGE = 'deploy_contract.py <contract_file> [node_url] [sender_private_key_file]'


def main():
    args = sys.argv[1:]
    if len(args) < 1:
        print(USAGE)
        sys.exit(1)
    contract_hex = Path(args[0]).read_text().strip()
    node_url = 'http://localhost:8545'
    sender = None
    if len(args) > 1:
        node_url = args[1]
    if len(args) > 2:
        pk = bytes.fromhex(Path(args[2]).read_text().strip().removeprefix('0x'))
        sender = Account.from_key(pk)
    fund_receipt, deploy_receipt = deploy_contract(node_url, sender, contract_hex)
    print(fund_receipt)
    print(deploy_receipt)


if __name__ == '__main__':
    main()
