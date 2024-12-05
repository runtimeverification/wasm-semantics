
#[cfg(test)]
mod encoding_tests {
    use crate::encoder::*;
    use crate::decoder::*;
    use crate::unsigned::*;

    #[test]
    fn empty_encoding() {
        let encoder = Encoder::new();
        let bytes = encoder.encode();
        assert_eq!(0, bytes.len());
        let decoder: Decoder<()> = Decoder::from_buffer(bytes);
        decoder.check_done();
    }

    #[test]
    fn u8_encoding() {
        let mut encoder = Encoder::new();
        encoder.add(&Unsigned::<1>::from_u64(7));
        let bytes = encoder.encode();
        assert_eq!(32, bytes.len());
        let decoder: Decoder<(Unsigned<1>, ())> = Decoder::from_buffer(bytes);
        let (value, decoder) = decoder.decode();
        assert_eq!(7, value.try_to_u64().unwrap());
        decoder.check_done();
    }

    #[test]
    fn u256_encoding() {
        let mut encoder = Encoder::new();
        encoder.add(&U256::from_u64(123456789));
        let bytes = encoder.encode();
        assert_eq!(32, bytes.len());
        let decoder: Decoder<(U256, ())> = Decoder::from_buffer(bytes);
        let (value, decoder) = decoder.decode();
        assert_eq!(123456789, value.try_to_u64().unwrap());
        decoder.check_done();
    }

    #[test]
    fn string_encoding() {
        let mut encoder = Encoder::new();
        encoder.add(&("Hello world".to_string()));
        let bytes = encoder.encode();
        assert_eq!(32 * 3, bytes.len());
        let decoder: Decoder<(String, ())> = Decoder::from_buffer(bytes);
        let (value, decoder) = decoder.decode();
        assert_eq!("Hello world", value);
        decoder.check_done();
    }

    #[test]
    fn multi_encoding() {
        let mut encoder = Encoder::new();
        encoder.add(&Unsigned::<1>::from_u64(7));
        encoder.add(&("Hello".to_string()));
        encoder.add(&U160::from_u64(123456789));
        encoder.add(&("world".to_string()));
        encoder.add(&U256::from_u64(987654321));
        let bytes = encoder.encode();
        assert_eq!(32 * 9, bytes.len());

        let decoder: Decoder<(Unsigned::<1>, (String, (U160, (String, (U256, ())))))>
                = Decoder::from_buffer(bytes);
        let (value_u8, decoder) = decoder.decode();
        assert_eq!(7, value_u8.try_to_u64().unwrap());
        let (value_str1, decoder) = decoder.decode();
        assert_eq!("Hello", value_str1);
        let (value_u160, decoder) = decoder.decode();
        assert_eq!(123456789, value_u160.try_to_u64().unwrap());
        let (value_str2, decoder) = decoder.decode();
        assert_eq!("world", value_str2);
        let (value_u256, decoder) = decoder.decode();
        assert_eq!(987654321, value_u256.try_to_u64().unwrap());
        decoder.check_done();
    }
}
