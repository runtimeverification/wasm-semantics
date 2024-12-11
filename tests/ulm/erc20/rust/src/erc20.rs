use std::cell::RefCell;
use std::rc::Rc;

use crate::address::Address;
use crate::assertions::fail;
use crate::balance::Balance;
use crate::encoder::Encoder;
use crate::require;
use crate::storage::{SingleChunkStorage, SingleChunkStorageBuilder};
use crate::ulm::{log3, Ulm};
use crate::ulm;

pub struct Erc20 {
  api: Rc<RefCell<dyn Ulm>>
}

impl Erc20 {
    pub fn new(api: Rc<RefCell<dyn Ulm>>) -> Self {
        Erc20 { api }
    }

    // ---------------------------

    fn s_total_supply<'a>(&self) -> SingleChunkStorage<'a, Balance> {
        SingleChunkStorageBuilder::new(self.api.clone(), &("total_supply".to_string())).build()
    }

    fn s_balances<'a>(&self, address: &Address) -> SingleChunkStorage<'a, Balance> {
        let mut builder = SingleChunkStorageBuilder::new(self.api.clone(), &("balances".to_string()));
        builder.add_arg(address);
        builder.build()
    }

    fn s_allowances<'a>(&self, account: &Address, spender: &Address) -> SingleChunkStorage<'a, Balance> {
        let mut builder = SingleChunkStorageBuilder::new(self.api.clone(), &("allowances".to_string()));
        builder.add_arg(account);
        builder.add_arg(spender);
        builder.build()
    }

    // ---------------------------

    fn transfer_event(&self, from: Address, to: Address, value: &Balance) {
        let mut encoder = Encoder::new();
        encoder.add(value);
        log3(
            &*self.api.borrow(),
            "Transfer(address,address,u256)",
            &from.into(), &to.into(),
            encoder.encode()
        )
    }

    fn approval_event(&self, owner: Address, spender: Address, value: &Balance) {
        let mut encoder = Encoder::new();
        encoder.add(value);
        log3(
            &*self.api.borrow(),
            "Approval(address,address,u256)",
            &owner.into(), &spender.into(),
            encoder.encode()
        )
    }

    // ---------------------------

    pub fn init(&self) {}

    pub fn decimals(&self) -> u8 {
        18
    }

    pub fn total_supply(&self) -> Balance {
        self.s_total_supply().get()
    }

    pub fn balance_of(&self, account: &Address) -> Balance {
        self.s_balances(account).get()
    }

    pub fn transfer(&self, to: &Address, value: &Balance) -> bool {
        let owner = ulm::caller(&*self.api.borrow());
        self._transfer(&owner, to, &value);
        true
    }

    pub fn allowance(&self, owner: &Address, spender: &Address) -> Balance {
        self.s_allowances(owner, spender).get()
    }

    pub fn approve(&self, spender: &Address, value: &Balance) -> bool {
        let owner = ulm::caller(&*self.api.borrow());
        self._approve(&owner, spender, value, true);
        true
    }

    pub fn transfer_from(&self, from: &Address, to: &Address, value: &Balance) -> bool {
        let spender = ulm::caller(&*self.api.borrow());
        self._spend_allowance(from, &spender, value);
        self._transfer(from, to, value);
        true
    }

    fn _transfer(&self, from: &Address, to: &Address, value: &Balance) {
        require!(!from.is_zero(), "Invalid sender");
        require!(!to.is_zero(), "Invalid receiver");
        self._update(from, to, value);
        self.transfer_event(from.clone(), to.clone(), value);
    }

    fn _update(&self, from: &Address, to: &Address, value: &Balance) {
        if from.is_zero() {
            self.s_total_supply().set(self.s_total_supply().get() + value);
        } else {
            let from_balance = self.s_balances(from).get();
            require!(value <= &from_balance, "Insufficient balance");
            self.s_balances(from).set(self.s_balances(from).get() - value);
        };

        if to.is_zero() {
            self.s_total_supply().set(self.s_total_supply().get() - value);
        } else {
            self.s_balances(to).set(self.s_balances(to).get() + value);
        }
    }

    pub fn mint(&self, account: &Address, value: &Balance) {
        require!(!account.is_zero(), "Zero address");
        self._update(&Address::zero(), account, value);
    }

    fn _approve(&self, owner: &Address, spender: &Address, value: &Balance, emit_event: bool) {
        require!(!owner.is_zero(), "Invalid approver");
        require!(!spender.is_zero(), "Invalid spender");
        self.s_allowances(owner, spender).set(value.clone());
        if emit_event {
            self.approval_event(owner.clone(), spender.clone(), &value);
        }
    }

    fn _spend_allowance(&self, owner: &Address, spender: &Address, value: &Balance) {
        let current_allowance = self.allowance(owner, spender);
        require!(value <= &current_allowance, "Insuficient allowance");
        self._approve(owner, spender, &(current_allowance - value), false);
    }
}


