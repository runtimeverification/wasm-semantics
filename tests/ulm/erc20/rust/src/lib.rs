// This contract is derived from
// https://github.com/Pi-Squared-Inc/pi2-examples/blob/b63d0a78922874a486be8a0395a627425fb5a052/solidity/src/tokens/SomeToken.sol

#![no_std]

#[allow(unused_imports)]

use core::cmp::Ordering;
use core::marker::PhantomData;
use core::ops::Add;
use core::ops::Sub;
use core::panic::PanicInfo;

// use ulm;
// use ulm_hooks;

mod ulm {
    extern "C" {
        #[allow(non_snake_case)]
        pub fn Log3(data1_id: u32, data2_id: u32, data3_id: u32, bytes_id: u32);
        #[allow(non_snake_case)]
        pub fn GetAccountStorage(key_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn SetAccountStorage(key_id: u32, value_id: u32);
        #[allow(non_snake_case)]
        pub fn SetOutput(bytes_id: u32);
        #[allow(non_snake_case)]
        pub fn Caller() -> u32;
        #[allow(non_snake_case)]
        pub fn CallData() -> u32;
    }
}

#[allow(non_snake_case)]
mod ulm_hooks {
    extern "C" {
        pub fn fail(msg: *const u8, msg_len: usize) -> !;

        #[allow(non_snake_case)]
        pub fn u256FromU64(value: u64) -> u32;
        #[allow(non_snake_case)]
        pub fn u256FromIntId(value_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn u256FromBytes(bytes_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn u160FromU64(value: u64) -> u32;
        #[allow(non_snake_case)]
        pub fn u160FromIntId(value_id: u32) -> u32;

        #[allow(non_snake_case)]
        pub fn intAdd(value1_id: u32, value2_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn intSub(value1_id: u32, value2_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn cmpInt(value1_id: u32, value2_id: u32) -> i32;

        #[allow(non_snake_case)]
        pub fn signatureFingerprint(value: *const u8, value_len: usize) -> u32;
        pub fn fingerprint(bytes_id: u32) -> u32;

        #[allow(non_snake_case)]
        pub fn newEncoder() -> u32;
        #[allow(non_snake_case)]
        pub fn encoderAddU256(encoder_id: u32, value_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn encoderAddStr(encoder_id: u32, value: *const u8, value_len: usize) -> u32;
        #[allow(non_snake_case)]
        pub fn encoderToBytes(encoder_id: u32) -> u32;

        // The decoder id points to a structure similar to this one:
        // struct Decoder {
        //     bytes: Bytes
        //     accumulated_head_lengths: u32[]  // sum of head lengths up to the current index
        // }
        pub fn decoderFromBuffer(bytes_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn decoderRegister(decoder_id: u32, head_size: u32, variable: bool) -> u32;
        #[allow(non_snake_case)]
        pub fn decoderValueCount(decoder_id: u32) -> u32;
        #[allow(non_snake_case)]
        pub fn decodeExtractBytes(decoder_id: u32, index: u32) -> u32;
        // Checks whether the registered values fit the decoder's bytes.
        #[allow(non_snake_case)]
        pub fn isValidDecoder(decoder_id:u32) -> bool;

        pub fn bytesLength(bytes_id: u32) -> u32;
        pub fn bytesSubstr(bytes_id: u32, start: u32, end: u32) -> u32;
        pub fn cmpBytes(bytes_id1: u32, bytes_id2: u32) -> i32;
    }

    #[allow(non_snake_case)]
    pub fn failWrapper(msg: &str) -> ! {
        let msg_bytes = msg.as_bytes();
        unsafe { fail(msg_bytes.as_ptr(), msg_bytes.len()); }
    }

    #[allow(non_snake_case)]
    pub fn signatureFingerprintWrapper(value: &str) -> u32 {
        let buf = value.as_bytes();
        unsafe { signatureFingerprint(buf.as_ptr(), buf.len()) }
    }

    #[allow(non_snake_case)]
    pub fn endpointFingerprintWrapper(value: &str) -> u32 {
        unsafe {
            let fp_id = signatureFingerprintWrapper(value);
            if bytesLength(fp_id) < 4 {
                failWrapper("Signature too short");
            }
            bytesSubstr(fp_id, 0, 4)
        }
    }

    #[allow(non_snake_case)]
    pub fn encoderAddStrWrapper(encoder_id: u32, value: &str) -> u32 {
        let buf = value.as_bytes();
        unsafe { encoderAddStr(encoder_id, buf.as_ptr(), buf.len()) }
    }
}

fn fail(msg: &str) -> ! {
    ulm_hooks::failWrapper(msg);
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    fail("Panic")
}

#[macro_export]
macro_rules! require {
    ( $cond:expr , $msg:expr ) => {
        if $cond {
            fail($msg);
        }
    }
}

#[allow(non_snake_case)]
fn CallerWrapper() -> Address {
    Address::from_id( unsafe { ulm::Caller() } )
}

struct Encoder {
    encoder_id: u32,
}

impl Encoder {
    fn new() -> Self {
        Encoder { encoder_id: unsafe { ulm_hooks::newEncoder() } }
    }

    fn add(self, value: &dyn Encodable) -> Self {
        Encoder { encoder_id: value.add_to(self.encoder_id) }
    }

    fn add_bool(self, value: bool) -> Self {
        Encoder {
            encoder_id: unsafe {
                ulm_hooks::encoderAddU256(
                    self.encoder_id,
                    ulm_hooks::u256FromU64(if value {1} else {0})
                )
            }
        }
    }

    fn add_u8(self, value: u8) -> Self {
        Encoder {
            encoder_id: unsafe {
                ulm_hooks::encoderAddU256(self.encoder_id, ulm_hooks::u256FromU64(value.into()))
            }
        }
    }


    fn add_str(self, value: &str) -> Self {
        Encoder {
            encoder_id: ulm_hooks::encoderAddStrWrapper(self.encoder_id, value)
        }
    }

    fn build(&self) -> Bytes {
        Bytes::from_id( unsafe { ulm_hooks::encoderToBytes(self.encoder_id) } )
    }
}

struct Decoder {
    decoder_id: u32,
    next_index: u32,
}

impl Decoder {
    fn from_buffer(buffer:Bytes) -> Decoder {
        Decoder {
            decoder_id: unsafe { ulm_hooks::decoderFromBuffer(buffer.bytes_id) },
            next_index: 0,
        }
    }
    fn check_done(&self) {
        let value_count = unsafe { ulm_hooks::decoderValueCount(self.decoder_id) };
        require!(self.next_index == value_count, "Did not read all input");
    }

    fn register_data<T:Decodable>(self) -> Decoder {
        let decoder_id = unsafe {
            ulm_hooks::decoderRegister(self.decoder_id, T::encoded_head_size(), T::is_variable_length())
        };
        Decoder {
            decoder_id,
            ..self
        }
    }

    fn validate_data(&self) {
        let is_valid = unsafe { ulm_hooks::isValidDecoder(self.decoder_id) };
        require!(is_valid, "Unexpected input.");
    }

    fn decode<T:Decodable>(self) -> (T, Decoder) {
        let obj_bytes = Bytes::from_id(unsafe {
            ulm_hooks::decodeExtractBytes(self.decoder_id, self.next_index)
        });
        let decoder = Decoder {
            next_index: self.next_index + 1,
            ..self
        };
        (T::decode(obj_bytes), decoder)
    }
}

trait Encodable {
    fn add_to(&self, encoder_id: u32) -> u32;
}

trait Decodable {
    fn is_variable_length() -> bool;
    fn encoded_head_size() -> u32;
    fn decode(bytes: Bytes) -> Self;
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

struct Bytes {
    bytes_id: u32
}

impl Bytes {
    fn from_id(bytes_id: u32) -> Bytes {
        Bytes { bytes_id }
    }

    fn length(&self) -> u32 {
        unsafe { ulm_hooks::bytesLength(self.bytes_id) }
    }

    fn substr(&self, start: u32, end: u32) -> Bytes {
        Bytes::from_id( unsafe { ulm_hooks::bytesSubstr(self.bytes_id, start, end) } )
    }
}
impl Ord for Bytes {
    fn cmp(&self, other: &Self) -> Ordering {
        let result = unsafe { ulm_hooks::cmpBytes(self.bytes_id, other.bytes_id) };
        if result < 0 {
            Ordering::Less
        } else if result > 0 {
            Ordering::Greater
        } else {
            Ordering::Equal
        }
    }
}
impl PartialOrd for Bytes {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}
impl PartialEq for Bytes {
    fn eq(&self, other: &Self) -> bool {
        self.cmp(other) == Ordering::Equal
    }
}
impl Eq for Bytes {}

struct U256 {
    int_id: u32,
}

impl U256 {
    fn from_id(int_id: u32) -> Self {
        U256 { int_id }
    }
}
impl Sub for U256 {
    type Output = U256;
    fn sub(self, other: U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intSub(self.int_id, other.int_id) } }
    }
}
impl Sub<&U256> for U256 {
    type Output = U256;
    fn sub(self, other: &U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intSub(self.int_id, other.int_id) } }
    }
}
impl Sub<U256> for &U256 {
    type Output = U256;
    fn sub(self, other: U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intSub(self.int_id, other.int_id) } }
    }
}
impl Sub for &U256 {
    type Output = U256;
    fn sub(self, other: &U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intSub(self.int_id, other.int_id) } }
    }
}
impl Add for U256 {
    type Output = U256;
    fn add(self, other: U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intAdd(self.int_id, other.int_id) } }
    }
}
impl Add<&U256> for U256 {
    type Output = U256;
    fn add(self, other: &U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intAdd(self.int_id, other.int_id) } }
    }
}
impl Add<U256> for &U256 {
    type Output = U256;
    fn add(self, other: U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intAdd(self.int_id, other.int_id) } }
    }
}
impl Add for &U256 {
    type Output = U256;
    fn add(self, other: &U256) -> U256 {
        U256 { int_id: unsafe { ulm_hooks::intAdd(self.int_id, other.int_id) } }
    }
}
impl Ord for U256 {
    fn cmp(&self, other: &Self) -> Ordering {
        let result = unsafe { ulm_hooks::cmpInt(self.int_id, other.int_id) };
        if result < 0 {
            Ordering::Less
        } else if result > 0 {
            Ordering::Greater
        } else {
            Ordering::Equal
        }
    }
}
impl PartialOrd for U256 {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}
impl PartialEq for U256 {
    fn eq(&self, other: &Self) -> bool {
        self.cmp(other) == Ordering::Equal
    }
}
impl Eq for U256 {}
impl Clone for U256 {
    fn clone(&self) -> Self {
        U256 { int_id: self.int_id }
    }
}
impl Encodable for U256 {
    fn add_to(&self, encoder_id: u32) -> u32 {
        unsafe { ulm_hooks::encoderAddU256(encoder_id, self.int_id) }
    }
}
impl Decodable for U256 {
    fn is_variable_length() -> bool {
        false
    }
    fn encoded_head_size() -> u32 {
        32
    }
    fn decode(bytes: Bytes) -> Self {
        let int_id = unsafe { ulm_hooks::u256FromBytes(bytes.bytes_id) };
        U256 { int_id }
    }
}

#[derive(PartialEq, Eq, PartialOrd, Ord)]
struct Balance {
    value: U256,
}

impl Sub for Balance {
    type Output = Balance;
    fn sub(self, other: Balance) -> Balance {
        Balance { value: &self.value - other.value }
    }
}
impl Sub<&Balance> for Balance {
    type Output = Balance;
    fn sub(self, other: &Balance) -> Balance {
        Balance { value: self.value - &other.value }
    }
}
impl Sub<Balance> for &Balance {
    type Output = Balance;
    fn sub(self, other: Balance) -> Balance {
        Balance { value: &self.value - other.value }
    }
}
impl Sub for &Balance {
    type Output = Balance;
    fn sub(self, other: &Balance) -> Balance {
        Balance { value: &self.value - &other.value }
    }
}
impl Add for Balance {
    type Output = Balance;
    fn add(self, other: Balance) -> Balance {
        Balance { value: &self.value + other.value }
    }
}
impl Add<&Balance> for Balance {
    type Output = Balance;
    fn add(self, other: &Balance) -> Balance {
        Balance { value: self.value + &other.value }
    }
}
impl Add<Balance> for &Balance {
    type Output = Balance;
    fn add(self, other: Balance) -> Balance {
        Balance { value: &self.value + other.value }
    }
}
impl Add for &Balance {
    type Output = Balance;
    fn add(self, other: &Balance) -> Balance {
        Balance { value: &self.value + &other.value }
    }
}
impl Into<U256> for Balance {
  fn into(self) -> U256 {
      self.value
  }
}
impl From<U256> for Balance {
  fn from(value: U256) -> Self {
      Balance { value }
  }
}
impl Clone for Balance {
    fn clone(&self) -> Self {
        Balance { value: self.value.clone() }
    }
}
impl Encodable for Balance {
    fn add_to(&self, encoder_id: u32) -> u32 {
        self.value.add_to(encoder_id)
    }
}
impl Decodable for Balance {
    fn is_variable_length() -> bool {
        U256::is_variable_length()
    }
    fn encoded_head_size() -> u32 {
        U256::encoded_head_size()
    }
    fn decode(bytes: Bytes) -> Self {
        let value = U256::decode(bytes);
        value.into()
    }
}

#[derive(Clone)]
struct Address {
    int_id: u32,
}

impl Address {
    fn zero() -> Address {
        Address{ int_id: unsafe { ulm_hooks::u160FromU64(0) } }
    }
    fn from_id(int_id: u32) -> Address {
        return Address { int_id }
    }

    fn is_zero(&self) -> bool {
        unsafe { ulm_hooks::cmpInt(self.int_id, Address::zero().int_id) == 0 }
    }
}

impl Into<U256> for &Address {
    fn into(self) -> U256 {
        U256::from_id( unsafe { ulm_hooks::u256FromIntId(self.int_id) } )
    }
}
impl From<U256> for Address {
    fn from(value: U256) -> Self {
        let int_id = unsafe { ulm_hooks::u160FromIntId(value.int_id) };
        Address { int_id }
    }
}

impl Encodable for Address {
    fn add_to(&self, encoder_id: u32) -> u32 {
        let converted: U256 = self.into();
        converted.add_to(encoder_id)
    }
}
impl Decodable for Address {
    fn is_variable_length() -> bool {
        U256::is_variable_length()
    }
    fn encoded_head_size() -> u32 {
        U256::encoded_head_size()
    }
    fn decode(bytes: Bytes) -> Self {
        let value = U256::decode(bytes);
        value.into()
    }
}


struct SingleValueMapper<ValueType:Into<U256> + From<U256> + 'static> {
    phantom: PhantomData<ValueType>,
    fingerprint: U256,
}

impl<ValueType:Into<U256> + From<U256>> SingleValueMapper<ValueType> {
    fn new(fingerprint: U256) -> Self {
        SingleValueMapper::<ValueType> { phantom: PhantomData, fingerprint }
    }

    fn set(&self, value: ValueType) {
        let converted: U256 = value.into();
        unsafe { ulm::SetAccountStorage(self.fingerprint.int_id, converted.int_id); }
    }

    fn get(&self) -> ValueType {
        let u256_id = unsafe { ulm::GetAccountStorage(self.fingerprint.int_id) };
        U256::from_id(u256_id).into()
    }
}

struct SingleValueMapperBuilder<ValueType:Into<U256> + From<U256> + 'static> {
    phantom: PhantomData<ValueType>,
    encoder: Encoder,
}

impl<ValueType:Into<U256> + From<U256>> SingleValueMapperBuilder<ValueType> {
    fn new(name: &str) -> Self {
        Self::from_encoder(Encoder::new().add_str(name))
    }

    fn from_encoder(encoder: Encoder) -> Self {
        SingleValueMapperBuilder::<ValueType> {
            phantom: PhantomData,
            encoder
        }
    }

    fn with_arg(self, arg: &dyn Encodable) -> Self {
        Self::from_encoder(self.encoder.add(arg))
    }

    fn build(self) -> SingleValueMapper<ValueType> {
        let bytes_id = self.encoder.build().bytes_id;
        let fingerprint = unsafe { ulm_hooks::fingerprint(bytes_id) };
        SingleValueMapper::new(U256::from_id(fingerprint))
    }
}

// ---------------------------

fn same_signature(expected: &Bytes, signature: &str) -> bool {
    expected == &Bytes::from_id(
        ulm_hooks::endpointFingerprintWrapper(signature)
    )
}

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

fn s_total_supply() -> SingleValueMapper<Balance> {
    SingleValueMapperBuilder::new("total_supply").build()
}

fn s_balances(address: &Address) -> SingleValueMapper<Balance> {
    SingleValueMapperBuilder::new("total_supply").with_arg(address).build()
}

fn s_allowances(account: &Address, spender: &Address) -> SingleValueMapper<Balance> {
    SingleValueMapperBuilder::new("total_supply").with_arg(account).with_arg(spender).build()
}

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
