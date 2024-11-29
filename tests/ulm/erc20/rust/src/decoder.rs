use crate::Bytes;
use crate::fail;
use crate::require;
use crate::ulm_hooks;

pub trait Decodable {
  fn is_variable_length() -> bool;
  fn encoded_head_size() -> u32;
  fn decode(bytes: Bytes) -> Self;
}

pub struct Decoder {
  decoder_id: u32,
  next_index: u32,
}

impl Decoder {
  pub fn from_buffer(buffer:Bytes) -> Decoder {
      Decoder {
          decoder_id: unsafe { ulm_hooks::decoderFromBuffer(buffer.bytes_id) },
          next_index: 0,
      }
  }
  pub fn check_done(&self) {
      let value_count = unsafe { ulm_hooks::decoderValueCount(self.decoder_id) };
      require!(self.next_index == value_count, "Did not read all input");
  }

  pub fn register_data<T:Decodable>(self) -> Decoder {
      let decoder_id = unsafe {
          ulm_hooks::decoderRegister(self.decoder_id, T::encoded_head_size(), T::is_variable_length())
      };
      Decoder {
          decoder_id,
          ..self
      }
  }

  pub fn validate_data(&self) {
      let is_valid = unsafe { ulm_hooks::isValidDecoder(self.decoder_id) };
      require!(is_valid, "Unexpected input.");
  }

  pub fn decode<T:Decodable>(self) -> (T, Decoder) {
      let obj_bytes = Bytes::from_id(unsafe {
          ulm_hooks::decodeExtractBytes(self.decoder_id, self.next_index)
      });
      let decoder = Decoder {
          next_index: self.next_index + 1,
          ..self
      };
      (T::decode(obj_bytes), decoder)
  }
}
