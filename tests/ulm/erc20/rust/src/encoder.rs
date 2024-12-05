// Encodes values according to the solidity ABI:
// https://docs.soliditylang.org/en/latest/abi-spec.html
//
// To encode, first implement the Encodable trait for the types you want to
// encode. Then do something like this:
//
// let mut encoder = Encoder::new();
// encoder.add(value_1);
// encoder.add(value_2);
// ...
// encoder.add(value_n);
// let encoded = encoder.encode();

use bytes::{Bytes, BytesMut, BufMut, Buf};

use crate::unsigned::U256;

pub enum EncodingType {
    FixedSize = 1,
    VariableSize = 2,
}

pub trait Encodable {
    fn encode(&self) -> (EncodingType, Bytes);
}

impl Encodable for String {
    fn encode(&self) -> (EncodingType, Bytes) {
        let bytes = self.as_bytes();
        let total_bytes_length = 32 + ((bytes.len() + 31) / 32) * 32; 
        let mut result = BytesMut::with_capacity(total_bytes_length);
        let (_, len_bytes) = U256::from_u64(bytes.len() as u64).encode();

        result.put(len_bytes);
        result.put(bytes);
        for _ in result.len() .. total_bytes_length {
            result.put_u8(0_u8);
        }

        (EncodingType::VariableSize, result.freeze())
    }
}

pub struct Encoder {
    objects: Vec<(EncodingType, Bytes)>,
}

impl Encoder {
    pub fn new() -> Self {
        Encoder { objects: Vec::new() }
    }

    pub fn add(&mut self, value: &dyn Encodable) {
        self.objects.push(value.encode());
    }

    pub fn encode(&self) -> Bytes {
        let head_size = self.head_size();
        let tail_size = self.tail_size();
        let mut prefix = BytesMut::with_capacity(head_size + tail_size);
        let mut suffix = BytesMut::with_capacity(tail_size);
        for (encoding_type, bytes) in self.objects.iter() {
            match encoding_type {
                EncodingType::FixedSize => prefix.extend_from_slice(bytes),
                EncodingType::VariableSize => {
                    let before_size = head_size + suffix.len();
                    let (_, prefix_chunk) = U256::from_u64(before_size as u64).encode();
                    prefix.put(prefix_chunk);
                    suffix.put(bytes.chunk());
                },
            }
        }
        prefix.put(suffix);
        prefix.freeze()
    }

    fn head_size(&self) -> usize {
        let mut size = 0_usize;
        for (encoding_type, bytes) in self.objects.iter() {
            let current_size =
                match encoding_type {
                    EncodingType::FixedSize => bytes.len(),
                    EncodingType::VariableSize => 32,
                };
            size += current_size;
        }
        size
    }

    fn tail_size(&self) -> usize {
        let mut size = 0_usize;
        for (encoding_type, bytes) in self.objects.iter() {
            let current_size =
                match encoding_type {
                    EncodingType::FixedSize => 0,
                    EncodingType::VariableSize => bytes.len(),
                };
            size += current_size;
        }
        size
    }
}
