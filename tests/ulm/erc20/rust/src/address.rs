use bytes::Bytes;
use core::cmp::Ordering;

use crate::decoder::Decodable;
use crate::encoder::{Encodable, EncodingType};
use crate::unsigned::{U160, U256};

#[derive(Debug)]
pub struct Address {
    value: U160,
}

impl Address {
    fn new(value: U160) -> Self {
        Address { value }
    }

    pub fn zero() -> Self {
        Address::new(U160::from_u64(0))
    }

    pub fn is_zero(&self) -> bool {
        self.value == U160::from_u64(0)
    }

    pub fn into_u160(self) -> U160 {
      self.value
    }
    pub fn into_u256(self) -> U256 {
        self.value.into()
    }
}

impl From<U160> for Address
{
    fn from(value: U160) -> Self {
        Address::new(value)
    }
}
impl TryFrom<U256> for Address
{
    type Error = &'static str;
    fn try_from(value: U256) -> Result<Self, Self::Error> {
        Ok(Address::new(value.try_into()?))
    }
}
impl From<Address> for U160
{
    fn from(value: Address) -> Self {
        value.into_u160()
    }
}
impl From<Address> for U256
{
    fn from(value: Address) -> Self {
        value.into_u256()
    }
}

impl Ord for Address {
    fn cmp(&self, other: &Self) -> Ordering {
        self.value.cmp(&other.value)
    }
}
impl PartialOrd for Address {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}
impl PartialEq for Address {
    fn eq(&self, other: &Self) -> bool {
        self.cmp(other) == Ordering::Equal
    }
}
impl Eq for Address {}
impl Clone for Address {
    fn clone(&self) -> Self {
        Address { value: self.value.clone() }
    }
}

impl Encodable for Address
{
    fn encode(&self) -> (EncodingType, Bytes) {
        self.value.encode()
    }
}
impl Decodable for Address
{
    fn encoding_type() -> EncodingType {
        U160::encoding_type()
    }
    fn head_size() -> usize {
        U160::head_size()
    }
    fn decode(bytes: Bytes) -> Self {
        Address::new(U160::decode(bytes))
    }
}
