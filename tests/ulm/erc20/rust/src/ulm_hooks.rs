extern "C" {
    #[allow(dead_code)]
    pub fn fail(msg: *const u8, msg_len: usize) -> !;
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
