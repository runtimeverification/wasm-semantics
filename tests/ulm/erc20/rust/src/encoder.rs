use crate::Bytes;
use crate::ulm_hooks;

pub trait Encodable {
  fn add_to(&self, encoder_id: u32) -> u32;
}

pub struct Encoder {
  encoder_id: u32,
}

impl Encoder {
  pub fn new() -> Self {
      Encoder { encoder_id: unsafe { ulm_hooks::newEncoder() } }
  }

  pub fn add(self, value: &dyn Encodable) -> Self {
      Encoder { encoder_id: value.add_to(self.encoder_id) }
  }

  pub fn add_bool(self, value: bool) -> Self {
      Encoder {
          encoder_id: unsafe {
              ulm_hooks::encoderAddU256(
                  self.encoder_id,
                  ulm_hooks::u256FromU64(if value {1} else {0})
              )
          }
      }
  }

  pub fn add_u8(self, value: u8) -> Self {
      Encoder {
          encoder_id: unsafe {
              ulm_hooks::encoderAddU256(self.encoder_id, ulm_hooks::u256FromU64(value.into()))
          }
      }
  }


  pub fn add_str(self, value: &str) -> Self {
      Encoder {
          encoder_id: ulm_hooks::encoderAddStrWrapper(self.encoder_id, value)
      }
  }

  pub fn build(&self) -> Bytes {
      Bytes::from_id( unsafe { ulm_hooks::encoderToBytes(self.encoder_id) } )
  }
}
