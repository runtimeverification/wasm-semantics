use core::cmp::Ordering;

use crate::ulm_hooks;

pub struct Bytes {
  pub bytes_id: u32
}

impl Bytes {
  pub fn from_id(bytes_id: u32) -> Bytes {
      Bytes { bytes_id }
  }

  pub fn length(&self) -> u32 {
      unsafe { ulm_hooks::bytesLength(self.bytes_id) }
  }

  pub fn substr(&self, start: u32, end: u32) -> Bytes {
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
