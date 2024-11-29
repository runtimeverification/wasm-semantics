use core::ops::Add;
use core::ops::Sub;

use crate::Bytes;
use crate::Encodable;
use crate::Decodable;
use crate::U256;

#[derive(PartialEq, Eq, PartialOrd, Ord)]
pub struct Balance {
    value: U256,
}

impl Sub for Balance {
    type Output = Balance;
    fn sub(self, other: Balance) -> Balance {
        Balance { value: &self.value - other.value }
    }
}
impl Sub<&Balance> for Balance {
    type Output = Balance;
    fn sub(self, other: &Balance) -> Balance {
        Balance { value: self.value - &other.value }
    }
}
impl Sub<Balance> for &Balance {
    type Output = Balance;
    fn sub(self, other: Balance) -> Balance {
        Balance { value: &self.value - other.value }
    }
}
impl Sub for &Balance {
    type Output = Balance;
    fn sub(self, other: &Balance) -> Balance {
        Balance { value: &self.value - &other.value }
    }
}
impl Add for Balance {
    type Output = Balance;
    fn add(self, other: Balance) -> Balance {
        Balance { value: &self.value + other.value }
    }
}
impl Add<&Balance> for Balance {
    type Output = Balance;
    fn add(self, other: &Balance) -> Balance {
        Balance { value: self.value + &other.value }
    }
}
impl Add<Balance> for &Balance {
    type Output = Balance;
    fn add(self, other: Balance) -> Balance {
        Balance { value: &self.value + other.value }
    }
}
impl Add for &Balance {
    type Output = Balance;
    fn add(self, other: &Balance) -> Balance {
        Balance { value: &self.value + &other.value }
    }
}
impl Into<U256> for Balance {
  fn into(self) -> U256 {
      self.value
  }
}
impl From<U256> for Balance {
  fn from(value: U256) -> Self {
      Balance { value }
  }
}
impl Clone for Balance {
    fn clone(&self) -> Self {
        Balance { value: self.value.clone() }
    }
}
impl Encodable for Balance {
    fn add_to(&self, encoder_id: u32) -> u32 {
        self.value.add_to(encoder_id)
    }
}
impl Decodable for Balance {
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
