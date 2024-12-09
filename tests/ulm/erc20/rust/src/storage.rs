// SingleChunkStorage is a class which makes it easy to work with storage
// for objects that fit in 32 bytes. Accessing storage will crash (fail) if
// the stored bytes cannot be converted to the value type.
//
// Let's say you want to access a storage object under the name N, with
// key (K1, K2, ..., Kn) and with type T. You need the following:
// * K1 ..., Kn must implement Encodable
// * T must implement TryFrom<U256> and Into<U256>
//
// Then you can build the storage object like this:
//
// let mut builder = SingleChunkStorageBuilder::<MyValueType>::new(api, hooks_api, &("Storage name".to_string()))
// builder.add_arg(K1);
// builder.add_arg(K2);
// ...
// builder.add_arg(Kn);
// let mut storage = builder.build();
//
// In order to set the storage value, do this:
//
// storage.set(&my_value);
//
// In order to get the stored value, do this:
//
// let my_value = storage.get();

use core::marker::PhantomData;
use std::cell::RefCell;
use std::convert::TryFrom;
use std::convert::Into;
use std::rc::Rc;

use crate::assertions::fail;
use crate::encoder::Encodable;
use crate::encoder::Encoder;
use crate::unsigned::U256;
use crate::ulm;
use crate::ulm_hooks;

pub struct SingleChunkStorage<'a, ValueType>
    where
        ValueType: Into<U256> + TryFrom<U256>,
{
    phantom_value: PhantomData<&'a ValueType>,
    api: Rc<RefCell<dyn ulm::Ulm>>,
    fingerprint: U256,
}

impl<'a, ValueType> SingleChunkStorage<'a, ValueType>
    where
        ValueType: Into<U256> + TryFrom<U256>,
{
    pub fn new(api: Rc<RefCell<dyn ulm::Ulm>>, fingerprint: U256) -> Self {
        SingleChunkStorage::<ValueType> { phantom_value: PhantomData, api, fingerprint }
    }

    pub fn set(&mut self, value: ValueType) {
        let converted: U256 = value.into();
        ulm::set_account_storage(&mut *self.api.borrow_mut(), &self.fingerprint, &converted);
    }

    pub fn get(&self) -> ValueType {
        let u256 = ulm::get_account_storage(&*self.api.borrow(), &self.fingerprint);
        match u256.try_into() {
            Ok(v) => v,
            Err(_) => fail("Conversion from U256 failed for storage"),
        }
    }
}

pub struct SingleChunkStorageBuilder<'a, ValueType>
    where
        ValueType: Into<U256> + TryFrom<U256>,
{
    phantom_value: PhantomData<&'a ValueType>,
    api: Rc<RefCell<dyn ulm::Ulm>>,
    hooks_api: Rc<RefCell<dyn ulm_hooks::UlmHooks>>,
    encoder: Encoder,
}

impl<'a, ValueType> SingleChunkStorageBuilder<'a, ValueType>
    where
        ValueType: Into<U256> + TryFrom<U256>,
{
    pub fn new(api: Rc<RefCell<dyn ulm::Ulm>>, hooks_api: Rc<RefCell<dyn ulm_hooks::UlmHooks>>, name: &String) -> Self {
        let mut encoder = Encoder::new();
        encoder.add(name);
        Self::from_encoder(api, hooks_api, encoder)
    }

    fn from_encoder(api: Rc<RefCell<dyn ulm::Ulm>>, hooks_api: Rc<RefCell<dyn ulm_hooks::UlmHooks>>, encoder: Encoder) -> Self {
        SingleChunkStorageBuilder::<ValueType> {
            phantom_value: PhantomData,
            api,
            hooks_api,
            encoder,
        }
    }

    pub fn add_arg(&mut self, arg: &dyn Encodable) {
        self.encoder.add(arg);
    }

    pub fn build(&mut self) -> SingleChunkStorage<ValueType> {
        let bytes = self.encoder.encode();
        let fingerprint = ulm_hooks::keccak_hash_int(&*self.hooks_api.borrow(), &bytes);
        SingleChunkStorage::new(self.api.clone(), fingerprint)
    }
}
