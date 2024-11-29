use core::marker::PhantomData;

use crate::Encodable;
use crate::Encoder;
use crate::U256;
use crate::ulm;
use crate::ulm_hooks;

pub struct SingleValueMapper<ValueType:Into<U256> + From<U256> + 'static> {
  phantom: PhantomData<ValueType>,
  fingerprint: U256,
}

impl<ValueType:Into<U256> + From<U256>> SingleValueMapper<ValueType> {
  pub fn new(fingerprint: U256) -> Self {
      SingleValueMapper::<ValueType> { phantom: PhantomData, fingerprint }
  }

  pub fn set(&self, value: ValueType) {
      let converted: U256 = value.into();
      unsafe { ulm::SetAccountStorage(self.fingerprint.int_id, converted.int_id); }
  }

  pub fn get(&self) -> ValueType {
      let u256_id = unsafe { ulm::GetAccountStorage(self.fingerprint.int_id) };
      U256::from_id(u256_id).into()
  }
}

pub struct SingleValueMapperBuilder<ValueType:Into<U256> + From<U256> + 'static> {
  phantom: PhantomData<ValueType>,
  encoder: Encoder,
}

impl<ValueType:Into<U256> + From<U256>> SingleValueMapperBuilder<ValueType> {
  pub fn new(name: &str) -> Self {
      Self::from_encoder(Encoder::new().add_str(name))
  }

  pub fn from_encoder(encoder: Encoder) -> Self {
      SingleValueMapperBuilder::<ValueType> {
          phantom: PhantomData,
          encoder
      }
  }

  pub fn with_arg(self, arg: &dyn Encodable) -> Self {
      Self::from_encoder(self.encoder.add(arg))
  }

  pub fn build(self) -> SingleValueMapper<ValueType> {
      let bytes_id = self.encoder.build().bytes_id;
      let fingerprint = unsafe { ulm_hooks::fingerprint(bytes_id) };
      SingleValueMapper::new(U256::from_id(fingerprint))
  }
}
