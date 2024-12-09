
#[cfg(test)]
mod unsigned_tests {
    use crate::unsigned::*;

    #[test]
    fn simple_addition() {
        let first = Unsigned::<1>::from_u64(2);
        let second = Unsigned::<1>::from_u64(3);
        let result: Unsigned<1> = first + second;
        assert_eq!(result, Unsigned::from_u64(5));
    }

    #[test]
    fn addition_byte_overflow() {
        let result: Unsigned<2> = Unsigned::from_u64(129) + Unsigned::from_u64(128);
        assert_eq!(result, Unsigned::from_u64(257));
    }

    #[test]
    fn simple_subtraction() {
        let result: Unsigned<1> = Unsigned::from_u64(5) - Unsigned::from_u64(3);
        assert_eq!(result, Unsigned::from_u64(2));
    }

    #[test]
    fn subtraction_byte_overflow() {
        let result: Unsigned<2> = Unsigned::from_u64(257) - Unsigned::from_u64(128);
        assert_eq!(result, Unsigned::from_u64(129));
    }

    #[test]
    fn eq() {
        assert_eq!(Unsigned::<1>::from_u64(5), Unsigned::from_u64(5));
        assert_ne!(Unsigned::<1>::from_u64(8), Unsigned::from_u64(5));
    }

    #[test]
    fn lt() {
        assert!(Unsigned::<1>::from_u64(5) < Unsigned::from_u64(8));
        assert!(!(Unsigned::<1>::from_u64(8) < Unsigned::from_u64(5)));
        assert!(Unsigned::<2>::from_u64(0x105) < Unsigned::from_u64(0x108));
        assert!(!(Unsigned::<2>::from_u64(0x108) < Unsigned::from_u64(0x105)));
    }

    #[test]
    fn le() {
        assert!(Unsigned::<1>::from_u64(5) <= Unsigned::from_u64(8));
        assert!(!(Unsigned::<1>::from_u64(8) <= Unsigned::from_u64(5)));
        assert!(Unsigned::<2>::from_u64(0x105) <= Unsigned::from_u64(0x108));
        assert!(!(Unsigned::<2>::from_u64(0x108) <= Unsigned::from_u64(0x105)));
        assert!(Unsigned::<2>::from_u64(0x105) <= Unsigned::from_u64(0x105));
    }

    #[test]
    fn gt() {
        assert!(Unsigned::<1>::from_u64(8) > Unsigned::from_u64(5));
        assert!(!(Unsigned::<1>::from_u64(5) > Unsigned::from_u64(8)));
        assert!(Unsigned::<2>::from_u64(0x108) > Unsigned::from_u64(0x105));
        assert!(!(Unsigned::<2>::from_u64(0x105) > Unsigned::from_u64(0x108)));
    }

    #[test]
    fn ge() {
        assert!(Unsigned::<1>::from_u64(8) >= Unsigned::from_u64(5));
        assert!(!(Unsigned::<1>::from_u64(5) >= Unsigned::from_u64(8)));
        assert!(Unsigned::<2>::from_u64(0x108) >= Unsigned::from_u64(0x105));
        assert!(!(Unsigned::<2>::from_u64(0x105) >= Unsigned::from_u64(0x108)));
        assert!(Unsigned::<2>::from_u64(0x105) >= Unsigned::from_u64(0x105));
    }

    #[test]
    fn from_unsigned() {
        assert_eq!(U256::from_u64(5), U256::try_from_unsigned(&U160::from_u64(5)).unwrap());
    }
}
