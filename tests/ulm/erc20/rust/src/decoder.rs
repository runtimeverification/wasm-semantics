// Decodes values according to the solidity ABI:
// https://docs.soliditylang.org/en/latest/abi-spec.html
//
// To decode, first implement the Decodable trait for the types you want to
// decode. Then create the decoder. Note that, if you want to decode n values,
// you have to provide the types for all n values in a tuple-based list that
// ends with ().
//
// let decoder: Decoder<(Type_1, (Type_2, (..., (Type_n, ())...)))>
//
// Then you can decode the actual values. Note that decoding a value provides
// a new decoder, which you must use in order to decode the subsequent values.
//
// let (value_1, decoder) = decoder.decode();
// let (value_2, decoder) = decoder.decode();
// ...
// let (value_n, decoder) = decoder.decode();
//
// At the end, it's good practice to check that you have decoded everything
// you wanted. The following will not compile if decoding didn't finish.
//
// decoder.check_done();

use bytes::{Bytes, Buf};
use core::marker::PhantomData;

use crate::assertions::fail;
use crate::require;
use crate::unsigned::U256;
use crate::encoder::EncodingType;

pub trait Decodable {
    fn encoding_type() -> EncodingType;
    fn head_size() -> usize;
    fn decode(bytes: Bytes) -> Self;
}

impl Decodable for String {
    fn encoding_type() -> EncodingType {
        EncodingType::VariableSize
    }
    fn head_size() -> usize {
        32
    }
    fn decode(bytes: Bytes) -> Self {
        let decoded = String::from_utf8(bytes.chunk().to_vec());
        match decoded {
            Ok(v) => v,
            Err(_) => fail("utf8 decoding error"),
        }
    }
}

pub struct Decoder<'a, T> {
    phantom: PhantomData<&'a T>,
    buffer: Bytes,
    next_value_head: usize,
}

impl<'a, T> Decoder<'a, T> {
    pub fn from_buffer(buffer: Bytes) -> Decoder<'a, T> {
        Decoder {
            phantom: PhantomData,
            buffer,
            next_value_head: 0,
        }
    }
}

impl<'a> Decoder<'a, ()> {
    pub fn check_done(&self) {
    }
}

impl<'a, S, T> Decoder<'a, (S, T)>
    where S:Decodable
{
    pub fn decode(self) -> (S, Decoder<'a, T>) {
        let head_size =
            match S::encoding_type() {
                EncodingType::VariableSize => 32,
                EncodingType::FixedSize => S::head_size(),
            };
        let current_value_head = self.next_value_head;
        let next_value_head = current_value_head + head_size;
        let head = self.buffer.slice(current_value_head .. next_value_head);
        let encoded_value =
            match S::encoding_type() {
                EncodingType::FixedSize => head,
                EncodingType::VariableSize => {
                    let value_start_u256 = U256::decode(head);
                    let value_start: usize = match value_start_u256.try_into() {
                        Ok(v) => v,
                        Err(s) => fail(s),
                    };
                    require!(value_start + 32 <= self.buffer.len(), "Value index out of range");
                    let value_length_u256 = U256::decode(self.buffer.slice(value_start .. value_start + 32));
                    let value_length: usize = match value_length_u256.try_into() {
                        Ok(v) => v,
                        Err(s) => fail(s),
                    };
                    require!(value_start + 32 + value_length < self.buffer.len(), "Value end out of range");
                    self.buffer.slice(value_start + 32 .. value_start + 32 + value_length)
                },
            };
        let decoded_value = S::decode(encoded_value);
        let decoder = Decoder::<T> {
            phantom: PhantomData,
            buffer: self.buffer,
            next_value_head,
        };
        (decoded_value, decoder)
    }
}
