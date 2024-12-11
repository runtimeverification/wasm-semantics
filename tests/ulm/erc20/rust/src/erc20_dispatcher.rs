use bytes::Bytes;
use core::cell::RefCell;
use std::rc::Rc;

use crate::address::Address;
use crate::assertions::fail;
use crate::balance::Balance;
use crate::decoder::Decoder;
use crate::encoder::Encoder;
use crate::erc20::Erc20;
use crate::require;
use crate::ulm;
use crate::unsigned::U256;

fn same_signature(api: &dyn ulm::Ulm, expected: &Bytes, signature: &str) -> bool {
    expected == &Bytes::copy_from_slice(&ulm::endpoint_fingerprint(api, signature))
}

#[cfg(not(test))]
#[no_mangle]
#[allow(non_snake_case)]
pub fn ulmDispatchCaller(init: bool) {
    dispatch(ulm::impl_::UlmImpl::new(), init);
}

fn dispatch(api: Rc<RefCell<dyn ulm::Ulm>>, init: bool) {
    let mut buffer = ulm::call_data(&*api.borrow());
    if init {
        initCaller(api, buffer);
    } else {
        require!(buffer.len() >= 4, "Buffer without function signature");
        let arguments = buffer.split_off(4);
        let signature = buffer;
        if same_signature(&*api.borrow(), &signature, "decimals()") {
            decimalsCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "totalSupply()") {
            totalSupplyCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "balanceOf(address)") {
            balanceOfCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "transfer(address,uint256)") {
            transferCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "allowance(address,address)") {
            allowanceCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "approve(address,uint256)") {
            approveCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "transferFrom(address,address,uint256)") {
            transferFromCaller(api, arguments);
        } else if same_signature(&*api.borrow(), &signature, "mint(address,uint256)") {
            mintCaller(api, arguments);
        } else {
            fail("Unknown endpoint");
        }
    }
}

#[allow(non_snake_case)]
fn initCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<()> = Decoder::from_buffer(arguments);
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    contract.init();

    let encoder = Encoder::new();
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn decimalsCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<()> = Decoder::from_buffer(arguments);
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.decimals();

    let mut encoder = Encoder::new();
    encoder.add(&U256::from_u8(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn totalSupplyCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<()> = Decoder::from_buffer(arguments);
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.total_supply();

    let mut encoder = Encoder::new();
    encoder.add(&U256::from(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn balanceOfCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<(Address, ())> = Decoder::from_buffer(arguments);
    let (address, decoder) = decoder.decode();
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.balance_of(&address);

    let mut encoder = Encoder::new();
    encoder.add(&U256::from(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn transferCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<(Address, (Balance, ()))> = Decoder::from_buffer(arguments);
    let (to, decoder) = decoder.decode();
    let (balance, decoder) = decoder.decode();
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.transfer(&to, &balance);

    let mut encoder = Encoder::new();
    encoder.add(&U256::from_bool(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn allowanceCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<(Address, (Address, ()))> = Decoder::from_buffer(arguments);
    let (owner, decoder) = decoder.decode();
    let (spender, decoder) = decoder.decode();
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.allowance(&owner, &spender);

    let mut encoder = Encoder::new();
    encoder.add(&U256::from(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn approveCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<(Address, (Balance, ()))> = Decoder::from_buffer(arguments);
    let (spender, decoder) = decoder.decode();
    let (value, decoder) = decoder.decode();
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.approve(&spender, &value);

    let mut encoder = Encoder::new();
    encoder.add(&U256::from_bool(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn transferFromCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<(Address, (Address, (Balance, ())))> = Decoder::from_buffer(arguments);
    let (from, decoder) = decoder.decode();
    let (to, decoder) = decoder.decode();
    let (value, decoder) = decoder.decode();
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    let value = contract.transfer_from(&from, &to, &value);

    let mut encoder = Encoder::new();
    encoder.add(&U256::from_bool(value));
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}

#[allow(non_snake_case)]
fn mintCaller(api: Rc<RefCell<dyn ulm::Ulm>>, arguments: Bytes) {
    let decoder: Decoder<(Address, (Balance, ()))> = Decoder::from_buffer(arguments);
    let (account, decoder) = decoder.decode();
    let (value, decoder) = decoder.decode();
    decoder.check_done();

    let contract = Erc20::new(api.clone());
    contract.mint(&account, &value);

    let encoder = Encoder::new();
    ulm::set_output(&mut *api.borrow_mut(), &encoder.encode());
}
