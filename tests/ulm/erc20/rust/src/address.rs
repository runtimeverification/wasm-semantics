use crate::Bytes;
use crate::Encodable;
use crate::Decodable;
use crate::U256;
use crate::ulm_hooks;

#[derive(Clone)]
pub struct Address {
    int_id: u32,
}

impl Address {
    pub fn zero() -> Address {
        Address{ int_id: unsafe { ulm_hooks::u160FromU64(0) } }
    }
    pub fn from_id(int_id: u32) -> Address {
        return Address { int_id }
    }

    pub fn is_zero(&self) -> bool {
        unsafe { ulm_hooks::cmpInt(self.int_id, Address::zero().int_id) == 0 }
    }
}

impl Into<U256> for &Address {
    fn into(self) -> U256 {
        U256::from_id( unsafe { ulm_hooks::u256FromIntId(self.int_id) } )
    }
}
impl From<U256> for Address {
    fn from(value: U256) -> Self {
        let int_id = unsafe { ulm_hooks::u160FromIntId(value.int_id) };
        Address { int_id }
    }
}

impl Encodable for Address {
    fn add_to(&self, encoder_id: u32) -> u32 {
        let converted: U256 = self.into();
        converted.add_to(encoder_id)
    }
}
impl Decodable for Address {
    fn is_variable_length() -> bool {
        U256::is_variable_length()
    }
    fn encoded_head_size() -> u32 {
        U256::encoded_head_size()
    }
    fn decode(bytes: Bytes) -> Self {
        let value = U256::decode(bytes);
        value.into()
    }
}
