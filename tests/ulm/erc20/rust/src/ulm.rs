extern "C" {
  #[allow(non_snake_case)]
  pub fn Log3(data1_id: u32, data2_id: u32, data3_id: u32, bytes_id: u32);
  #[allow(non_snake_case)]
  pub fn GetAccountStorage(key_id: u32) -> u32;
  #[allow(non_snake_case)]
  pub fn SetAccountStorage(key_id: u32, value_id: u32);
  #[allow(non_snake_case)]
  pub fn SetOutput(bytes_id: u32);
  #[allow(non_snake_case)]
  pub fn Caller() -> u32;
  #[allow(non_snake_case)]
  pub fn CallData() -> u32;
}
