from web3 import Web3


def mkaddr():
    w3 = Web3()
    acct = w3.eth.account.create()
    return (acct.address, w3.to_hex(acct.key))


def main():
    address, key = mkaddr()
    print(f'{address} {key}')


if __name__ == '__main__':
    main()
