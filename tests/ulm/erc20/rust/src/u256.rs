use core::cmp::Ordering;
use core::ops::Add;
use core::ops::Sub;

use crate::ulm_hooks;
use crate::Bytes;
use crate::Encodable;
use crate::Decodable;

pub struct U256 {
  pub int_id: u32,
}

impl U256 {
  pub fn from_id(int_id: u32) -> Self {
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
