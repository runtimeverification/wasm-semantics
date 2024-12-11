use bytes::Bytes;
use core::cmp::Ordering;
use core::ops::{Add, Sub};

use crate::decoder::Decodable;
use crate::encoder::{Encodable, EncodingType};
use crate::unsigned::U256;

#[derive(Debug)]
pub struct Balance {
    value: U256
}

impl Balance {
    pub fn new(value: U256) -> Self {
        Balance { value }
    }

    pub fn into_u256(self) -> U256 {
        self.value
    }

    pub fn into_u256_ref(&self) -> &U256 {
        &self.value
    }
}

impl TryFrom<U256> for Balance
{
    type Error = &'static str;
    fn try_from(value: U256) -> Result<Self, Self::Error> {
        Ok(Balance { value })
    }
}
impl From<Balance> for U256
{
    fn from(value: Balance) -> Self {
        value.into_u256()
    }
}

impl Add for &Balance {
    type Output = Balance;
    fn add(self, other: &Balance) -> Self::Output {
        Balance { value: (&self.value) + &other.value }
    }
}
impl Add for Balance {
    type Output = Balance;
    fn add(self, other: Balance) -> Self::Output {
        &self + &other
    }
}
impl Add<Balance> for &Balance {
    type Output = Balance;
    fn add(self, other: Balance) -> Self::Output {
        self + &other
    }
}
impl Add<&Balance> for Balance {
    type Output = Balance;
    fn add(self, other: &Balance) -> Self::Output {
        &self + other
    }
}

impl Sub for &Balance {
    type Output = Balance;
    fn sub(self, other: &Balance) -> Self::Output {
        Balance { value: (&self.value) - &other.value }
    }
}
impl Sub for Balance {
    type Output = Balance;
    fn sub(self, other: Balance) -> Self::Output {
        &self - &other
    }
}
impl Sub<Balance> for &Balance {
    type Output = Balance;
    fn sub(self, other: Balance) -> Self::Output {
        self - &other
    }
}
impl Sub<&Balance> for Balance {
    type Output = Balance;
    fn sub(self, other: &Balance) -> Self::Output {
        &self - other
    }
}

impl Ord for Balance {
    fn cmp(&self, other: &Self) -> Ordering {
        self.value.cmp(&other.value)
    }
}
impl PartialOrd for Balance {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}
impl PartialEq for Balance {
    fn eq(&self, other: &Self) -> bool {
        self.cmp(other) == Ordering::Equal
    }
}
impl Eq for Balance {}
impl Clone for Balance {
    fn clone(&self) -> Self {
        Balance { value: self.value.clone() }
    }
}
impl Encodable for Balance
{
    fn encode(&self) -> (EncodingType, Bytes) {
        self.into_u256_ref().encode()
    }
}
impl Decodable for Balance
{
    fn encoding_type() -> EncodingType {
        U256::encoding_type()
    }
    fn head_size() -> usize {
        U256::head_size()
    }
    fn decode(bytes: Bytes) -> Self {
        let value = U256::decode(bytes);
        Balance { value }
    }
}

