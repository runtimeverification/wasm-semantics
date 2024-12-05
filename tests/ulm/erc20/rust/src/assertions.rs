
use crate::ulm_hooks;

pub fn fail(msg: &str) -> ! {
  ulm_hooks::failWrapper(msg);
}

#[macro_export]
macro_rules! require {
  ( $cond:expr , $msg:expr ) => {
      if ! $cond {
          fail($msg);
      }
  }
}
