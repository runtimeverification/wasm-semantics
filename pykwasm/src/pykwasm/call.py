#!/usr/bin/python3
import sys
from pathlib import Path

from eth_account import Account
from requests.exceptions import ConnectionError
from web3 import Web3
from web3.exceptions import BadFunctionCallOutput, Web3RPCError
from web3.middleware import SignAndSendRawMiddlewareBuilder

ABI_MAP = {
    'erc20': [
        {'type': 'function', 'name': 'decimals', 'inputs': [], 'outputs': ['uint8'], 'stateMutability': 'view'},
        {'type': 'function', 'name': 'totalSupply', 'inputs': [], 'outputs': ['uint256'], 'stateMutability': 'view'},
        {
            'type': 'function',
            'name': 'balanceOf',
            'inputs': [{'name': 'owner', 'type': 'address'}],
            'outputs': [{'name': '', 'type': 'uint256'}],
            'stateMutability': 'view',
        },
        {
            'type': 'function',
            'name': 'transfer',
            'inputs': [{'name': 'to', 'type': 'address'}, {'name': 'value', 'type': 'uint256'}],
            'outputs': [{'name': '', 'type': 'bool'}],
        },
        {
            'type': 'function',
            'name': 'transferFrom',
            'inputs': [
                {'name': 'from', 'type': 'address'},
                {'name': 'to', 'type': 'address'},
                {'name': 'value', 'type': 'uint256'},
            ],
            'outputs': [{'name': '', 'type': 'bool'}],
        },
        {
            'type': 'function',
            'name': 'approve',
            'inputs': [{'name': 'spender', 'type': 'address'}, {'name': 'value', 'type': 'uint256'}],
            'outputs': [{'name': '', 'type': 'bool'}],
        },
        {
            'type': 'function',
            'name': 'allowance',
            'inputs': [{'name': 'owner', 'type': 'address'}, {'name': 'spender', 'type': 'address'}],
            'outputs': [{'name': '', 'type': 'uint256'}],
            'stateMutability': 'view',
        },
        {
            'type': 'function',
            'name': 'mint',
            'inputs': [{'name': 'account', 'type': 'address'}, {'name': 'value', 'type': 'uint256'}],
            'outputs': [],
        },
    ]
}


def parse_arg(param_ty, arg):
    match param_ty:
        case 'uint256':
            try:
                return int(arg)
            except ValueError:
                pass
            try:
                return int(arg, 16)
            except ValueError as err:
                raise ValueError(f'Failed to parse numeric argument {arg}') from err
        case 'address':
            assert Web3.is_address(arg)
            return arg


def parse_params(abi, method, args):
    for elt in abi:
        parsed_args = []
        ty, name, inputs = elt['type'], elt['name'], elt['inputs']
        if ty == 'function' and name == method:
            if len(inputs) != len(args):
                raise ValueError('call to method {method} with {inputs} has incorrect parameters {params}')
            for param, arg in zip(inputs, args, strict=True):
                parsed_args.append(parse_arg(param['type'], arg))
            break
    else:
        raise ValueError(f'method {method} not found in contract ABI')
    return parsed_args


def run_method(w3, contract, sender, eth, method, params):
    func = contract.functions[method](*params)
    view_like = func.abi.get('stateMutability', 'nonpayable') in {'view', 'pure'}
    try:
        if view_like:
            result_or_receipt = func.call()
        else:
            tx_hash = func.transact({'from': sender.address, 'value': eth})
            result_or_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
    except (ConnectionError, BadFunctionCallOutput, Web3RPCError) as e:
        if isinstance(e, (ConnectionError, ConnectionRefusedError)):
            msg = f'Failed to connect to node: {e.message}'
        elif isinstance(e, BadFunctionCallOutput):
            msg = f'Could not interpret function output: {",".join(e.args)}'
        else:
            msg = f'Node RPC encountered an error: {e.message}'
        print(msg, file=sys.stderr)
        sys.exit(1)

    return (view_like, result_or_receipt)


USAGE = 'call.py <node_url> <contract_abi> <contract_address_lit_or_file> <sender_private_key_file> <eth> <method> [param...]'


def main():
    args = sys.argv[1:]
    if len(args) < 6:
        print(USAGE, file=sys.stderr)
        sys.exit(1)
    (node_url, abi_name, addr_lit_or_file, sender_pk_file, eth, method), params = args[:6], args[6:]
    # get web3 instance
    w3 = Web3(Web3.HTTPProvider(node_url))
    # get abi
    abi = ABI_MAP[abi_name]
    # get contract
    try:
        contract_addr = Path(addr_lit_or_file).read_text().strip()
    except FileNotFoundError:
        contract_addr = addr_lit_or_file
    contract = w3.eth.contract(address=contract_addr, abi=abi)
    # validate method
    try:
        contract.functions[method]
    except BaseException:  # noqa: B036
        print(f'Invalid method {method} for {abi_name} contract ABI', file=sys.stderr)
        sys.exit(1)
    # get sender
    pk = bytes.fromhex(Path(sender_pk_file).read_text().strip().removeprefix('0x'))
    sender = Account.from_key(pk)
    # add signer
    w3.middleware_onion.inject(SignAndSendRawMiddlewareBuilder.build(sender), layer=0)
    # parse params
    params = parse_params(abi, method, params)
    eth = int(eth)
    # run method
    (view_like, result_or_receipt) = run_method(w3, contract, sender, eth, method, params)
    # handle result
    if view_like:
        print(result_or_receipt)
    else:
        # return exit code based on status which is 1 for confirmed and 0 for reverted
        success = bool(result_or_receipt['status'])
        if not success:
            print(result_or_receipt, file=sys.stderr)
        sys.exit(int(not success))


if __name__ == '__main__':
    main()
