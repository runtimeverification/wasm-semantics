#!/usr/bin/python3
import sys
from pathlib import Path

from eth_account import Account
from web3 import Web3
from web3.exceptions import Web3RPCError
from web3.middleware import SignAndSendRawMiddlewareBuilder


def deploy_contract(w3, sender, contract_hex):
    # deploy txn
    deploy_token_tx = {
        'from': sender.address,
        'data': contract_hex,
        'to': '',
        'value': 0,
        # NOTE: we provide extra gas to the txn here
        #       because, by default, the estimator does
        #       not give us enough gas for our very
        #       large contract files
        'gas': 110000000,
        'maxFeePerGas': 2000000000,
        'maxPriorityFeePerGas': 1000000000,
    }
    try:
        deploy_tx_hash = w3.eth.send_transaction(deploy_token_tx)
        deploy_tx_receipt = w3.eth.wait_for_transaction_receipt(deploy_tx_hash)
    except ConnectionError:
        print('Failed to connect to node', file=sys.stderr)
        sys.exit(1)
    except Web3RPCError as e:
        print(f'Failed to deploy contract to node: {e.message}', file=sys.stderr)
        sys.exit(1)
    return deploy_tx_receipt


USAGE = 'deploy_contract.py <contract_file> [node_url] [sender_private_key_file]'


def main():
    # check arg length
    args = sys.argv[1:]
    if len(args) < 1:
        print(USAGE, file=sys.stderr)
        sys.exit(1)

    # parse args
    contract_hex = Path(args[0]).read_text().strip()
    node_url = 'http://localhost:8545'
    sender = None
    if len(args) > 1:
        node_url = args[1]
    if len(args) > 2:
        pk = bytes.fromhex(Path(args[2]).read_text().strip().removeprefix('0x'))
        sender = Account.from_key(pk)

    # get w3 instance
    w3 = Web3(Web3.HTTPProvider(node_url))
    w3.middleware_onion.inject(SignAndSendRawMiddlewareBuilder.build(sender), layer=0)

    # deploy contract
    deploy_receipt = deploy_contract(w3, sender, contract_hex)

    # get address and status
    contract_address = deploy_receipt['contractAddress']
    success = bool(deploy_receipt['status'])

    # print contract address on success, nothing on failure
    if success and contract_address:
        print(contract_address)
    else:
        print(deploy_receipt, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
