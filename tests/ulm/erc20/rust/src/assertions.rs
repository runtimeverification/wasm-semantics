
use crate::ulm;

pub fn fail(msg: &str) -> ! {
  ulm::failWrapper(msg);
}

#[macro_export]
macro_rules! require {
  ( $cond:expr , $msg:expr ) => {
      if ! $cond {
          fail($msg);
      }
  }
}
