use crate::unsigned::U256;

#[cfg(not(test))]
extern "C" {
    // key and value must have a length of exactly 32.
    #[allow(non_snake_case)]
    pub fn GetAccountStorage(key: *const u8, value: *mut u8);

    // key and value must have a length of exactly 32.
    #[allow(non_snake_case)]
    pub fn SetAccountStorage(key: *const u8, value: *const u8);
}

pub trait Ulm {
    fn get_account_storage(&self, key: &[u8; 32], value: &mut [u8; 32]);
    fn set_account_storage(&mut self, key: &[u8; 32], value: &[u8; 32]);
}

#[cfg(not(test))]
struct UlmImpl {}

#[cfg(not(test))]
impl Ulm for UlmImpl {
    fn get_account_storage(&self, key: &[u8; 32], value: &mut [u8; 32]) {
        unsafe { GetAccountStorage(key.as_ptr(), value.as_mut_ptr()); }
    }

    fn set_account_storage(&mut self, key: &[u8; 32], value: &[u8; 32]) {
        unsafe { SetAccountStorage(key.as_ptr(), value.as_ptr()); }
    }
}

#[cfg(test)]
pub mod mock {
    use bytes::{Bytes, Buf};
    use std::cell::RefCell;
    use std::collections::HashMap;
    use std::rc::Rc;

    use crate::assertions::fail;
    use crate::require;
    use crate::ulm::Ulm;

    pub struct UlmMock {
        storage: HashMap<Bytes, Bytes>,
    }

    impl UlmMock {
        pub fn new() -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(UlmMock { storage: HashMap::new() }))
        }
    }

    impl Ulm for UlmMock {
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
    }
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
