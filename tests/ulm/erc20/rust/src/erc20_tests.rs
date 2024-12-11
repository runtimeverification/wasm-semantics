#[cfg(test)]
mod erc20_tests {
    use crate::address::Address;
    use crate::balance::Balance;
    use crate::erc20::*;
    use crate::ulm;
    use crate::unsigned::*;

    fn balance(value: u64) -> Balance {
        Balance::new(U256::from_u64(value))
    }
    fn address(value: u64) -> Address {
        U160::from_u64(value).into()
    }

    #[test]
    fn decimals_test() {
        let api = ulm::mock::UlmMock::new();

        let erc20 = Erc20::new(api);

        assert_eq!(18, erc20.decimals());
    }

    #[test]
    fn mint_test() {
        let api = ulm::mock::UlmMock::new();

        let erc20 = Erc20::new(api);

        let account1 = address(123);
        let account2 = address(456);

        assert_eq!(balance(0), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(0), erc20.total_supply());

        erc20.mint(&account1, &balance(1000));

        assert_eq!(balance(1000), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(1000), erc20.total_supply());

        erc20.mint(&account2, &balance(2000));

        assert_eq!(balance(1000), erc20.balance_of(&account1));
        assert_eq!(balance(2000), erc20.balance_of(&account2));
        assert_eq!(balance(3000), erc20.total_supply());
    }

    #[test]
    fn transfer_test() {
        let api = ulm::mock::UlmMock::new();

        let erc20 = Erc20::new(api.clone());

        let account1 = address(123);
        let account2 = address(456);

        (*(api.borrow_mut())).set_caller(account1.clone());

        assert_eq!(balance(0), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(0), erc20.total_supply());

        erc20.mint(&account1, &balance(1000));

        assert_eq!(balance(1000), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(1000), erc20.total_supply());

        erc20.transfer(&account2, &balance(200));

        assert_eq!(balance(800), erc20.balance_of(&account1));
        assert_eq!(balance(200), erc20.balance_of(&account2));
        assert_eq!(balance(1000), erc20.total_supply());
    }

    #[test]
    fn transfer_from_test() {
        let api = ulm::mock::UlmMock::new();

        let erc20 = Erc20::new(api.clone());

        let account1 = address(123);
        let account2 = address(456);
        let account3 = address(789);

        (*(api.borrow_mut())).set_caller(account1.clone());

        assert_eq!(balance(0), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(0), erc20.balance_of(&account3));
        assert_eq!(balance(0), erc20.total_supply());
        assert_eq!(balance(0), erc20.allowance(&account1, &account2));
        assert_eq!(balance(0), erc20.allowance(&account1, &account3));
        assert_eq!(balance(0), erc20.allowance(&account2, &account1));
        assert_eq!(balance(0), erc20.allowance(&account2, &account3));
        assert_eq!(balance(0), erc20.allowance(&account3, &account1));
        assert_eq!(balance(0), erc20.allowance(&account3, &account2));

        erc20.mint(&account1, &balance(1000));

        assert_eq!(balance(1000), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(0), erc20.balance_of(&account3));
        assert_eq!(balance(1000), erc20.total_supply());
        assert_eq!(balance(0), erc20.allowance(&account1, &account2));
        assert_eq!(balance(0), erc20.allowance(&account1, &account3));
        assert_eq!(balance(0), erc20.allowance(&account2, &account1));
        assert_eq!(balance(0), erc20.allowance(&account2, &account3));
        assert_eq!(balance(0), erc20.allowance(&account3, &account1));
        assert_eq!(balance(0), erc20.allowance(&account3, &account2));

        erc20.approve(&account2, &balance(300));

        assert_eq!(balance(1000), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(0), erc20.balance_of(&account3));
        assert_eq!(balance(1000), erc20.total_supply());
        assert_eq!(balance(300), erc20.allowance(&account1, &account2));
        assert_eq!(balance(0), erc20.allowance(&account1, &account3));
        assert_eq!(balance(0), erc20.allowance(&account2, &account1));
        assert_eq!(balance(0), erc20.allowance(&account2, &account3));
        assert_eq!(balance(0), erc20.allowance(&account3, &account1));
        assert_eq!(balance(0), erc20.allowance(&account3, &account2));

        (*(api.borrow_mut())).set_caller(account2.clone());

        erc20.transfer_from(&account1, &account3, &balance(200));

        assert_eq!(balance(800), erc20.balance_of(&account1));
        assert_eq!(balance(0), erc20.balance_of(&account2));
        assert_eq!(balance(200), erc20.balance_of(&account3));
        assert_eq!(balance(1000), erc20.total_supply());
        assert_eq!(balance(100), erc20.allowance(&account1, &account2));
        assert_eq!(balance(0), erc20.allowance(&account1, &account3));
        assert_eq!(balance(0), erc20.allowance(&account2, &account1));
        assert_eq!(balance(0), erc20.allowance(&account2, &account3));
        assert_eq!(balance(0), erc20.allowance(&account3, &account1));
        assert_eq!(balance(0), erc20.allowance(&account3, &account2));

        erc20.transfer_from(&account1, &account2, &balance(100));

        assert_eq!(balance(700), erc20.balance_of(&account1));
        assert_eq!(balance(100), erc20.balance_of(&account2));
        assert_eq!(balance(200), erc20.balance_of(&account3));
        assert_eq!(balance(1000), erc20.total_supply());
        assert_eq!(balance(0), erc20.allowance(&account1, &account2));
        assert_eq!(balance(0), erc20.allowance(&account1, &account3));
        assert_eq!(balance(0), erc20.allowance(&account2, &account1));
        assert_eq!(balance(0), erc20.allowance(&account2, &account3));
        assert_eq!(balance(0), erc20.allowance(&account3, &account1));
        assert_eq!(balance(0), erc20.allowance(&account3, &account2));
    }
}
