// This contract is derived from
// https://github.com/Pi-Squared-Inc/pi2-examples/blob/b63d0a78922874a486be8a0395a627425fb5a052/solidity/src/tokens/SomeToken.sol

#![no_std]

mod address;
mod assertions;
mod balance;
mod bytes;
mod encoder;
mod decoder;
mod ulm;
mod ulm_hooks;
mod u256;
mod value_mapper;

use address::*;
use assertions::*;
use balance::*;
use bytes::*;
use decoder::*;
use encoder::*;
use u256::*;
use value_mapper::*;

#[allow(non_snake_case)]
fn CallerWrapper() -> Address {
    Address::from_id( unsafe { ulm::Caller() } )
}

fn log3(signature: &str, first: U256, second: U256, data: &Bytes) {
    unsafe {
        ulm :: Log3(
            ulm_hooks::signatureFingerprintWrapper(signature),
            first.int_id,
            second.int_id,
            data.bytes_id
        );
    }
}

fn same_signature(expected: &Bytes, signature: &str) -> bool {
    expected == &Bytes::from_id(
        ulm_hooks::endpointFingerprintWrapper(signature)
    )
}

// ---------------------------

#[no_mangle]
pub fn dispatch(init: bool) {
    let buffer_id = unsafe { ulm::CallData() };
    let buffer = Bytes::from_id(buffer_id);
    if init {
        initCaller(Decoder::from_buffer(buffer));
    } else {
        require!(buffer.length() <= 4, "Buffer without function signature");
        let signature = buffer.substr(0, 4);
        let buffer = buffer.substr(4, buffer.length());
        let decoder = Decoder::from_buffer(buffer);
        if same_signature(&signature, "decimals()") {
            decimalsCaller(decoder);
        } else if same_signature(&signature, "totalSupply()") {
            totalSupplyCaller(decoder);
        } else if same_signature(&signature, "balanceOf(address)") {
            balanceOfCaller(decoder);
        } else if same_signature(&signature, "transfer(address,uint256)") {
            transferCaller(decoder);
        } else if same_signature(&signature, "allowance(address,address)") {
            allowanceCaller(decoder);
        } else if same_signature(&signature, "approve(address,uint256)") {
            approveCaller(decoder);
        } else if same_signature(&signature, "transferFrom(address,address,uint256)") {
            transferFromCaller(decoder);
        } else {
            fail("Unknown endpoint");
        }
    }
}

// ---------------------------

fn s_total_supply() -> SingleValueMapper<Balance> {
    SingleValueMapperBuilder::new("total_supply").build()
}

fn s_balances(address: &Address) -> SingleValueMapper<Balance> {
    SingleValueMapperBuilder::new("total_supply").with_arg(address).build()
}

fn s_allowances(account: &Address, spender: &Address) -> SingleValueMapper<Balance> {
    SingleValueMapperBuilder::new("total_supply").with_arg(account).with_arg(spender).build()
}

// ---------------------------

fn transfer_event(from: &Address, to: &Address, value: &Balance) {
    log3(
        "Transfer(address,address,u256)",
        from.into(), to.into(),
        &Encoder::new().add(value).build()
    )
}

fn approval_event(owner: &Address, spender: &Address, value: &Balance) {
    log3(
        "Approval(address,address,u256)",
        owner.into(), spender.into(),
        &Encoder::new().add(value).build()
    )
}

// ---------------------------

#[allow(non_snake_case)]
fn initCaller(decoder: Decoder) {
    decoder.check_done();
    init();
    let bytes_id = Encoder::new().build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn init() {}

#[allow(non_snake_case)]
fn decimalsCaller(decoder: Decoder) {
    decoder.check_done();
    let value = decimals();
    let bytes_id = Encoder::new().add_u8(value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn decimals() -> u8 {
    18
}

#[allow(non_snake_case)]
fn totalSupplyCaller(decoder: Decoder) {
    decoder.check_done();
    let value = total_supply();
    let bytes_id = Encoder::new().add(&value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn total_supply() -> Balance {
    s_total_supply().get()
}

#[allow(non_snake_case)]
fn balanceOfCaller(decoder: Decoder) {
    let decoder = decoder.register_data::<Address>();
    decoder.validate_data();

    let (address, decoder) = decoder.decode::<Address>();
    decoder.check_done();

    let value = balance_of(&address);

    let bytes_id = Encoder::new().add(&value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn balance_of(account: &Address) -> Balance {
    s_balances(account).get()
}

#[allow(non_snake_case)]
fn transferCaller(decoder: Decoder) {
    let decoder = decoder.register_data::<Address>();
    let decoder = decoder.register_data::<Balance>();
    decoder.validate_data();

    let (to, decoder) = decoder.decode::<Address>();
    let (balance, decoder) = decoder.decode::<Balance>();
    decoder.check_done();

    let value = transfer(&to, &balance);

    let bytes_id = Encoder::new().add_bool(value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn transfer(to: &Address, value: &Balance) -> bool {
    let owner = CallerWrapper();
    _transfer(&owner, to, &value);
    true
}

#[allow(non_snake_case)]
fn allowanceCaller(decoder: Decoder) {
    let decoder = decoder.register_data::<Address>();
    let decoder = decoder.register_data::<Address>();
    decoder.validate_data();

    let (owner, decoder) = decoder.decode::<Address>();
    let (spender, decoder) = decoder.decode::<Address>();
    decoder.check_done();

    let value = allowance(&owner, &spender);

    let bytes_id = Encoder::new().add(&value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn allowance(owner: &Address, spender: &Address) -> Balance {
    s_allowances(owner, spender).get()
}

#[allow(non_snake_case)]
fn approveCaller(decoder: Decoder) {
    let decoder = decoder.register_data::<Address>();
    let decoder = decoder.register_data::<Balance>();
    decoder.validate_data();

    let (spender, decoder) = decoder.decode::<Address>();
    let (value, decoder) = decoder.decode::<Balance>();
    decoder.check_done();

    let value = approve(&spender, &value);

    let bytes_id = Encoder::new().add_bool(value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn approve(spender: &Address, value: &Balance) -> bool {
    let owner = CallerWrapper();
    _approve(&owner, spender, value, true);
    true
}

#[allow(non_snake_case)]
fn transferFromCaller(decoder: Decoder) {
    let decoder = decoder.register_data::<Address>();
    let decoder = decoder.register_data::<Address>();
    let decoder = decoder.register_data::<Balance>();
    decoder.validate_data();

    let (from, decoder) = decoder.decode::<Address>();
    let (to, decoder) = decoder.decode::<Address>();
    let (value, decoder) = decoder.decode::<Balance>();
    decoder.check_done();

    let value = transfer_from(&from, &to, &value);

    let bytes_id = Encoder::new().add_bool(value).build().bytes_id;
    unsafe { ulm::SetOutput(bytes_id); }
}

fn transfer_from(from: &Address, to: &Address, value: &Balance) -> bool {
    let spender = CallerWrapper();
    _spend_allowance(from, &spender, value);
    _transfer(from, to, value);
    true
}

fn _transfer(from: &Address, to: &Address, value: &Balance) {
    require!(!from.is_zero(), "Invalid sender");
    require!(!to.is_zero(), "Invalid receiver");
    _update(from, to, value);
    transfer_event(from, to, value);
}

fn _update(from: &Address, to: &Address, value: &Balance) {
    if from.is_zero() {
        s_total_supply().set(s_total_supply().get() + value);
    } else {
        let from_balance = s_balances(from).get();
        require!(value <= &from_balance, "Insufficient balance");
        s_balances(from).set(s_balances(from).get() - value);
    };

    if to.is_zero() {
        s_total_supply().set(s_total_supply().get() - value);
    } else {
        s_balances(to).set(s_balances(to).get() + value);
    }
}

fn _mint(account: &Address, value: &Balance) {
    require!(!account.is_zero(), "Zero address");
    _update(&Address::zero(), account, value);
}

fn _approve(owner: &Address, spender: &Address, value: &Balance, emit_event: bool) {
    require!(!owner.is_zero(), "Invalid approver");
    require!(!spender.is_zero(), "Invalid spender");
    s_allowances(owner, spender).set(value.clone());
    if emit_event {
        approval_event(owner, spender, &value);
    }
}

fn _spend_allowance(owner: &Address, spender: &Address, value: &Balance) {
    let current_allowance = allowance(owner, spender);
    require!(value <= &current_allowance, "Insuficient allowance");
    _approve(owner, spender, &(current_allowance - value), false);
}
