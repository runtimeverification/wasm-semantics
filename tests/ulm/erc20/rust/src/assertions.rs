use core::panic::PanicInfo;

use crate::ulm_hooks;

pub fn fail(msg: &str) -> ! {
  ulm_hooks::failWrapper(msg);
}

#[panic_handler]
pub fn panic(_info: &PanicInfo) -> ! {
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
