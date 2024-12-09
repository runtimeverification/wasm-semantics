#[cfg(test)]
mod encoding_tests {
    use crate::storage::*;
    use crate::ulm;
    use crate::unsigned::*;

    #[test]
    fn read_value_not_set() {
        let api = ulm::mock::UlmMock::new();
        let mut builder = SingleChunkStorageBuilder::<U256>::new(api, &("my_storage".to_string()));

        let storage = builder.build();
        let value: U256 = storage.get();

        assert_eq!(U256::from_u64(0), value);
    }

    #[test]
    fn write_read_u256() {
        let api = ulm::mock::UlmMock::new();
        let mut builder = SingleChunkStorageBuilder::<U256>::new(api, &("my_storage".to_string()));

        let mut storage = builder.build();
        storage.set(U256::from_u64(123456789));
        let value: U256 = storage.get();

        assert_eq!(U256::from_u64(123456789), value);
    }

    #[test]
    fn write_read_u8() {
        let api = ulm::mock::UlmMock::new();
        let mut builder = SingleChunkStorageBuilder::<Unsigned::<1>>::new(api, &("my_storage".to_string()));

        let mut storage = builder.build();
        storage.set(Unsigned::<1>::from_u64(123));
        let value: Unsigned<1> = storage.get();

        assert_eq!(Unsigned::<1>::from_u64(123), value);
    }

    #[test]
    fn write_read_args() {
        let api = ulm::mock::UlmMock::new();

        let mut builder = SingleChunkStorageBuilder::<U256>::new(api, &("my_storage".to_string()));

        builder.add_arg(&U256::from_u64(5));

        let mut storage = builder.build();
        storage.set(U256::from_u64(123456789));
        let value: U256 = storage.get();

        assert_eq!(U256::from_u64(123456789), value);
    }

    #[test]
    fn no_confusion() {
        let api = ulm::mock::UlmMock::new();

        let mut builder1 = SingleChunkStorageBuilder::<U256>::new(api.clone(), &("my_storage".to_string()));
        let mut builder2 = SingleChunkStorageBuilder::<U256>::new(api.clone(), &("my_storage1".to_string()));
        let mut builder3 = SingleChunkStorageBuilder::<U256>::new(api.clone(), &("my_storage".to_string()));
        let mut builder4 = SingleChunkStorageBuilder::<U256>::new(api.clone(), &("my_storage".to_string()));
        let mut builder5 = SingleChunkStorageBuilder::<U256>::new(api, &("my_storage".to_string()));

        builder3.add_arg(&U256::from_u64(3));
        builder4.add_arg(&U256::from_u64(4));
        builder5.add_arg(&U256::from_u64(3));
        builder5.add_arg(&U256::from_u64(4));

        let mut storage1 = builder1.build();
        let mut storage2 = builder2.build();
        let mut storage3 = builder3.build();
        let mut storage4 = builder4.build();
        let mut storage5 = builder5.build();

        storage1.set(U256::from_u64(1));
        storage2.set(U256::from_u64(2));
        storage3.set(U256::from_u64(3));
        storage4.set(U256::from_u64(4));
        storage5.set(U256::from_u64(5));

        let value1: U256 = storage1.get();
        let value2: U256 = storage2.get();
        let value3: U256 = storage3.get();
        let value4: U256 = storage4.get();
        let value5: U256 = storage5.get();

        assert_eq!(U256::from_u64(1), value1);
        assert_eq!(U256::from_u64(2), value2);
        assert_eq!(U256::from_u64(3), value3);
        assert_eq!(U256::from_u64(4), value4);
        assert_eq!(U256::from_u64(5), value5);
    }
}
