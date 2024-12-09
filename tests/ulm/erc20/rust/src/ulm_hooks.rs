use bytes::{Bytes, Buf};

use crate::unsigned::U256;

#[cfg(not(test))]
extern "C" {
    #[allow(dead_code)]
    pub fn fail(msg: *const u8, msg_len: usize) -> !;

    // result must have a length of exactly 32.
    pub fn keccakHash(msg: *const u8, msg_len: usize, result: *mut u8);
}

#[cfg(test)]
pub mod overrides {
    #[no_mangle]
    pub extern "C" fn fail(_msg: *const u8, _msg_len: usize) -> ! {
        panic!("fail called");
    }
}

#[cfg(test)]
#[allow(non_snake_case)]
pub fn failWrapper(msg: &str) -> ! {
    panic!("{}", msg);
}

#[cfg(not(test))]
#[allow(non_snake_case)]
pub fn failWrapper(msg: &str) -> ! {
    let msg_bytes = msg.as_bytes();
    unsafe { fail(msg_bytes.as_ptr(), msg_bytes.len()); }
}

pub trait UlmHooks {
    fn keccak_hash(&self, value: &[u8], result: &mut [u8; 32]);
}

#[cfg(not(test))]
struct UlmHooksImpl {
}

#[cfg(not(test))]
impl UlmHooksImpl {
    pub fn new() -> Self {
        UlmHooksImpl {}
    }
}

#[cfg(not(test))]
impl UlmHooks for UlmHooksImpl {
    fn keccak_hash(&self, value: &[u8], result: &mut [u8; 32]) {
        unsafe { keccakHash(value.as_ptr(), value.len(), result.as_mut_ptr()); }
    }
}

#[cfg(test)]
pub mod mock {
    use std::cell::RefCell;
    use std::rc::Rc;

    use crate::ulm_hooks::UlmHooks;

    pub struct UlmHooksMock {}
    impl UlmHooksMock {
        pub fn new() -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(UlmHooksMock {}))
        }
    }
    impl UlmHooks for UlmHooksMock {
        fn keccak_hash(&self, value: &[u8], result: &mut [u8; 32]) {
            for i in 1 .. result.len() {
                result[i] = 0;
            }
            for i in 1 .. value.len() {
                result[i % 32] ^= value[i];
            }
        }
    }
}

pub fn keccak_hash(api: &dyn UlmHooks, value: &Bytes) -> [u8; 32] {
    let mut fingerprint = [0_u8; 32];
    api.keccak_hash(value.chunk(), &mut fingerprint);
    fingerprint
}


pub fn keccak_hash_int(api: &dyn UlmHooks, value: &Bytes) -> U256 {
    let fingerprint = keccak_hash(api, value);
    U256::from_array_le(fingerprint)
}
