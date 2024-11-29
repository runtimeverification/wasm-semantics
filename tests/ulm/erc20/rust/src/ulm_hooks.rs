extern "C" {
  pub fn fail(msg: *const u8, msg_len: usize) -> !;

  #[allow(non_snake_case)]
  pub fn u256FromU64(value: u64) -> u32;
  #[allow(non_snake_case)]
  pub fn u256FromIntId(value_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn u256FromBytes(bytes_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn u160FromU64(value: u64) -> u32;
  #[allow(non_snake_case)]
  pub fn u160FromIntId(value_id: u32) -> u32;

  #[allow(non_snake_case)]
  pub fn intAdd(value1_id: u32, value2_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn intSub(value1_id: u32, value2_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn cmpInt(value1_id: u32, value2_id: u32) -> i32;

  #[allow(non_snake_case)]
  pub fn signatureFingerprint(value: *const u8, value_len: usize) -> u32;
  pub fn fingerprint(bytes_id: u32) -> u32;

  #[allow(non_snake_case)]
  pub fn newEncoder() -> u32;
  #[allow(non_snake_case)]
  pub fn encoderAddU256(encoder_id: u32, value_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn encoderAddStr(encoder_id: u32, value: *const u8, value_len: usize) -> u32;
  #[allow(non_snake_case)]
  pub fn encoderToBytes(encoder_id: u32) -> u32;

  // The decoder id points to a structure similar to this one:
  // struct Decoder {
  //     bytes: Bytes
  //     accumulated_head_lengths: u32[]  // sum of head lengths up to the current index
  // }
  pub fn decoderFromBuffer(bytes_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn decoderRegister(decoder_id: u32, head_size: u32, variable: bool) -> u32;
  #[allow(non_snake_case)]
  pub fn decoderValueCount(decoder_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn decodeExtractBytes(decoder_id: u32, index: u32) -> u32;
  // Checks whether the registered values fit the decoder's bytes.
  #[allow(non_snake_case)]
  pub fn isValidDecoder(decoder_id:u32) -> bool;

  pub fn bytesLength(bytes_id: u32) -> u32;
  pub fn bytesSubstr(bytes_id: u32, start: u32, end: u32) -> u32;
  pub fn cmpBytes(bytes_id1: u32, bytes_id2: u32) -> i32;
}

#[allow(non_snake_case)]
pub fn failWrapper(msg: &str) -> ! {
  let msg_bytes = msg.as_bytes();
  unsafe { fail(msg_bytes.as_ptr(), msg_bytes.len()); }
}

#[allow(non_snake_case)]
pub fn signatureFingerprintWrapper(value: &str) -> u32 {
  let buf = value.as_bytes();
  unsafe { signatureFingerprint(buf.as_ptr(), buf.len()) }
}

#[allow(non_snake_case)]
pub fn endpointFingerprintWrapper(value: &str) -> u32 {
  unsafe {
      let fp_id = signatureFingerprintWrapper(value);
      if bytesLength(fp_id) < 4 {
          failWrapper("Signature too short");
      }
      bytesSubstr(fp_id, 0, 4)
  }
}

#[allow(non_snake_case)]
pub fn encoderAddStrWrapper(encoder_id: u32, value: &str) -> u32 {
  let buf = value.as_bytes();
  unsafe { encoderAddStr(encoder_id, buf.as_ptr(), buf.len()) }
}
