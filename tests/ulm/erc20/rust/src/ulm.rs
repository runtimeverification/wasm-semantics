use bytes::{Bytes, Buf};

use crate::address::Address;
use crate::unsigned::{U160, U256};

#[cfg(test)]
pub mod overrides {
    #[no_mangle]
    pub extern "C" fn fail(_msg: *const u8, _msg_len: usize) -> ! {
        panic!("fail called");
    }
}

#[cfg(test)]
pub use mock::failWrapper;
#[cfg(not(test))]
pub use impl_::failWrapper;

pub trait Ulm {
    fn log3(&self, data1: &[u8; 32], data2: &[u8; 32], data3: &[u8; 32], bytes: &[u8]);
    fn caller(&self, result: &mut [u8; 20]);

    fn call_data_length(&self) -> u32;
    fn call_data(&self, result: &mut [u8]);

    fn get_account_storage(&self, key: &[u8; 32], value: &mut [u8; 32]);
    fn set_account_storage(&mut self, key: &[u8; 32], value: &[u8; 32]);

    fn set_output(&mut self, bytes: &[u8]);

    fn keccak_hash(&self, value: &[u8], result: &mut [u8; 32]);
}

#[cfg(not(test))]
pub mod impl_ {
    use core::cell::RefCell;
    use std::rc::Rc;

    use crate::ulm::Ulm;

    extern "C" {
        // data1, data2 and data3 must have a length of exactly 32.
        #[allow(non_snake_case)]
        pub fn Log3(data1: *const u8, data2: *const u8, data3: *const u8, bytes: *const u8, bytes_length: usize);

        // result must have a length of exactly 20.
        #[allow(non_snake_case)]
        pub fn Caller(result: *mut u8);

        #[allow(non_snake_case)]
        pub fn CallDataLength() -> u32;
        // result must have a length of at least CallDataLength()
        #[allow(non_snake_case)]
        pub fn CallData(result: *mut u8);

        // key and value must have a length of exactly 32.
        #[allow(non_snake_case)]
        pub fn GetAccountStorage(key: *const u8, value: *mut u8);

        // key and value must have a length of exactly 32.
        #[allow(non_snake_case)]
        pub fn SetAccountStorage(key: *const u8, value: *const u8);


        #[allow(non_snake_case)]
        pub fn setOutput(bytes: *const u8, bytes_length: usize);

        #[allow(dead_code)]
        pub fn fail(msg: *const u8, msg_len: usize) -> !;

        // result must have a length of exactly 32.
        pub fn keccakHash(msg: *const u8, msg_len: usize, result: *mut u8);

    }

    #[allow(non_snake_case)]
    pub fn failWrapper(msg: &str) -> ! {
        let msg_bytes = msg.as_bytes();
        unsafe { fail(msg_bytes.as_ptr(), msg_bytes.len()); }
    }

    pub struct UlmImpl {}

    impl UlmImpl {
      pub fn new() -> Rc<RefCell<Self>> {
          Rc::new(RefCell::new(UlmImpl {}))
      }
    }

    impl Ulm for UlmImpl {
        fn log3(&self, data1: &[u8; 32], data2: &[u8; 32], data3: &[u8; 32], bytes: &[u8]) {
            unsafe { Log3(data1.as_ptr(), data2.as_ptr(), data3.as_ptr(), bytes.as_ptr(), bytes.len()); }
        }
        fn caller(&self, result: &mut [u8; 20]) {
            unsafe { Caller(result.as_mut_ptr()); }
        }

        fn call_data_length(&self) -> u32 {
            unsafe { CallDataLength() }
        }
        fn call_data(&self, result: &mut [u8]) {
            let required_len = self.call_data_length();
            if result.len() < required_len.try_into().unwrap() {
                failWrapper("call_data: buffer too small.");
            }
            unsafe { CallData(result.as_mut_ptr()); }
        }

        fn get_account_storage(&self, key: &[u8; 32], value: &mut [u8; 32]) {
            unsafe { GetAccountStorage(key.as_ptr(), value.as_mut_ptr()); }
        }

        fn set_account_storage(&mut self, key: &[u8; 32], value: &[u8; 32]) {
            unsafe { SetAccountStorage(key.as_ptr(), value.as_ptr()); }
        }

        fn set_output(&mut self, bytes: &[u8]) {
            unsafe { setOutput(bytes.as_ptr(), bytes.len()); }
        }

        fn keccak_hash(&self, value: &[u8], result: &mut [u8; 32]) {
            unsafe { keccakHash(value.as_ptr(), value.len(), result.as_mut_ptr()); }
        }
    }
}

#[cfg(test)]
pub mod mock {
    use bytes::{Bytes, Buf};
    use std::cell::RefCell;
    use std::collections::HashMap;
    use std::rc::Rc;

    use crate::address::Address;
    use crate::assertions::fail;
    use crate::require;
    use crate::ulm::Ulm;
    use crate::unsigned::U160;

    #[allow(non_snake_case)]
    pub fn failWrapper(msg: &str) -> ! {
        panic!("{}", msg);
    }

    pub struct UlmMock {
        storage: HashMap<Bytes, Bytes>,
        caller: [u8; 20],
        call_data: Bytes,
    }

    impl UlmMock {
        pub fn new() -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(UlmMock {
                storage: HashMap::new(),
                caller: [0_u8; 20],
                call_data: Bytes::new(),
            }))
        }
        pub fn set_caller(&mut self, caller: Address) {
            let caller_nr: U160 = caller.into();
            caller_nr.copy_to_array_le(&mut self.caller);
        }
    }

    impl Ulm for UlmMock {
        fn log3(&self, _data1: &[u8; 32], _data2: &[u8; 32], _data3: &[u8; 32], _bytes: &[u8]) {}

        fn caller(&self, result: &mut [u8; 20]) {
            *result = self.caller;
        }

        fn call_data_length(&self) -> u32 {
            self.call_data.len().try_into().unwrap()
        }
        fn call_data(&self, result: &mut [u8]) {
            let required_len = self.call_data_length();
            require!(result.len() >= required_len.try_into().unwrap(), "call_data: buffer too small.");
            require!(result.len() <= required_len.try_into().unwrap(), "call_data mock: buffer too large.");
            result.copy_from_slice(self.call_data.chunk());
        }

        fn get_account_storage(&self, key: &[u8; 32], value: &mut [u8; 32]) {
            let bytes_key = Bytes::copy_from_slice(key);
            match self.storage.get(&bytes_key) {
                Some(v) => {
                    let bytes_value = v.chunk();
                    require!(bytes_value.len() == 32, "unexpected value length in storage");
                    value.copy_from_slice(bytes_value);
                },
                None => {
                    for i in 0 .. value.len() {
                        value[i] = 0;
                    }
                },
            }
        }

        fn set_account_storage(&mut self, key: &[u8; 32], value: &[u8; 32]) {
            let bytes_key = Bytes::copy_from_slice(key);
            let bytes_value = Bytes::copy_from_slice(value);
            self.storage.insert(bytes_key, bytes_value);
        }

        fn set_output(&mut self, bytes: &[u8]) {
            self.call_data = Bytes::copy_from_slice(bytes);
        }

        fn keccak_hash(&self, value: &[u8], result: &mut [u8; 32]) {
            for i in 1 .. result.len() {
                result[i] = 0;
            }
            let mut assimetry: u16 = 1;
            for i in 0 .. value.len() {
                let assimetric_value: u16 = (value[i] as u16) * assimetry;
                result[i % 32] ^= assimetric_value as u8;
                assimetry = (assimetry * 3) & 0xff;
            }
        }
    }
}

pub fn log3(api: &dyn Ulm, signature: &str, data2: &U256, data3: &U256, bytes: Bytes) {
    let signature_fingerprint = keccak_hash_int(api, &Bytes::copy_from_slice(signature.as_bytes()));
    let mut data1_bytes = [0_u8; 32];
    signature_fingerprint.copy_to_array_le(&mut data1_bytes);

    let mut data2_bytes = [0_u8; 32];
    data2.copy_to_array_le(&mut data2_bytes);
    let mut data3_bytes = [0_u8; 32];
    data3.copy_to_array_le(&mut data3_bytes);
    let bytes_bytes = bytes.chunk();

    api.log3(&data1_bytes, &data2_bytes, &data3_bytes, &bytes_bytes);
}

pub fn caller(api: &dyn Ulm) -> Address {
    let mut result = [0_u8; 20];
    api.caller(&mut result);
    U160::from_array_le(result).into()
}

pub fn call_data(api: &dyn Ulm) -> Bytes {
    let length: usize = api.call_data_length().try_into().unwrap();
    let mut buf : Vec<u8> = vec![0; length];
    api.call_data(buf.as_mut_slice());
    Bytes::copy_from_slice(buf.as_slice())
}

pub fn get_account_storage(api: &dyn Ulm, key: &U256) -> U256 {
    let mut key_bytes = [0_u8; 32];
    key.copy_to_array_le(&mut key_bytes);

    let mut value_bytes = [0_u8; 32];
    api.get_account_storage(&key_bytes, &mut value_bytes);

    U256::from_array_le(value_bytes)
}

pub fn set_account_storage(api: &mut dyn Ulm, key: &U256, value: &U256) {
    let mut key_bytes = [0_u8; 32];
    key.copy_to_array_le(&mut key_bytes);

    let mut value_bytes = [0_u8; 32];
    value.copy_to_array_le(&mut value_bytes);

    api.set_account_storage(&key_bytes, &value_bytes);
}

pub fn set_output(api: &mut dyn Ulm, bytes: &Bytes) {
    api.set_output(bytes.chunk());
}

pub fn keccak_hash(api: &dyn Ulm, value: &Bytes) -> [u8; 32] {
    let mut fingerprint = [0_u8; 32];
    api.keccak_hash(value.chunk(), &mut fingerprint);
    fingerprint
}

pub fn keccak_hash_int(api: &dyn Ulm, value: &Bytes) -> U256 {
    let fingerprint = keccak_hash(api, value);
    U256::from_array_le(fingerprint)
}

pub fn endpoint_fingerprint(api: &dyn Ulm, value: &str) -> [u8; 4] {
    let fingerprint = keccak_hash(api, &Bytes::copy_from_slice(value.as_bytes()));
    [fingerprint[0], fingerprint[1], fingerprint[2], fingerprint[3], ]
}