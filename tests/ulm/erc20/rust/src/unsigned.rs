// This is a suboptimal implementation of an unsigned int, which is small and
// therefore useful for testing the wasm semantics. A proper implementation
// should probably use something like ruint2::Uint<..., ...> or uint256::Uint256.

use core::cmp::Ordering;
use core::ops::Add;
use core::ops::Sub;

use crate::assertions::fail;
use crate::require;

#[derive(Debug)]
pub struct Unsigned<const N: usize> {
    chunks: [u8; N],
}

// pub type U72  = Unsigned<9>;
// pub type U80  = Unsigned<10>;
// pub type U88  = Unsigned<11>;
// pub type U96  = Unsigned<12>;
// pub type U104 = Unsigned<13>;
// pub type U112 = Unsigned<14>;
// pub type U120 = Unsigned<15>;
// pub type U128 = Unsigned<16>;
// pub type U136 = Unsigned<17>;
// pub type U144 = Unsigned<18>;
// pub type U152 = Unsigned<19>;
pub type U160 = Unsigned<20>;
// pub type U168 = Unsigned<21>;
// pub type U176 = Unsigned<22>;
// pub type U184 = Unsigned<23>;
// pub type U192 = Unsigned<24>;
// pub type U200 = Unsigned<25>;
// pub type U208 = Unsigned<26>;
// pub type U216 = Unsigned<27>;
// pub type U224 = Unsigned<28>;
// pub type U232 = Unsigned<29>;
// pub type U240 = Unsigned<30>;
// pub type U248 = Unsigned<31>;
pub type U256 = Unsigned<32>;

impl<const N: usize> Unsigned<N> {
    pub fn from_unsigned<const M: usize>(value: &Unsigned<M>) -> Unsigned<N> {
        let mut chunks = [0_u8; N];
        if M <= N {
            for i in 0 .. M {
                chunks[i] = value.chunks[i];
            }
        } else {
            for i in 0 .. N {
                chunks[i] = value.chunks[i];
            }
            for i in N .. M {
                require!(value.chunks[i] == 0, "Value too large to cast");
            }
        }
        Unsigned { chunks }
    }

    pub fn from_u64(value: u64) -> Unsigned<N> {
        if 8 <= N {
            let mut chunks = [0_u8; N];
            let mut to_process = value;
            for i in 0 .. 8 {
                chunks[i] = (to_process & 0xff) as u8;
                to_process = to_process >> 8;
            }
            require!(to_process == 0, "Unprocessed bits in value.");
            Unsigned { chunks }
        } else {
            Unsigned::from_unsigned(&Unsigned::<8>::from_u64(value))
        }
    }
}

impl<const N: usize> Add for &Unsigned<N> {
    type Output = Unsigned<N>;
    fn add(self, other: &Unsigned<N>) -> Self::Output {
        let mut chunks = [0_u8; N];
        let mut carry = 0_u16;
        for i in 0..N {
            let value = (self.chunks[i] as u16) + (other.chunks[i] as u16) + carry;
            carry = value >> 8;
            chunks[i] = (value & 0xff) as u8;
        }
        require!(carry == 0, "Addition overflow");
        Unsigned { chunks }
    }
}
impl<const N: usize> Add for Unsigned<N> {
    type Output = Unsigned<N>;
    fn add(self, other: Unsigned<N>) -> Self::Output {
        &self + &other
    }
}
impl<const N: usize> Add<Unsigned<N>> for &Unsigned<N> {
    type Output = Unsigned<N>;
    fn add(self, other: Unsigned<N>) -> Self::Output {
        self + &other
    }
}
impl<const N: usize> Add<&Unsigned<N>> for Unsigned<N> {
    type Output = Unsigned<N>;
    fn add(self, other: &Unsigned<N>) -> Self::Output {
        &self + other
    }
}

impl<const N: usize> Sub for &Unsigned<N> {
    type Output = Unsigned<N>;
    fn sub(self, other: &Unsigned<N>) -> Self::Output {
        let mut chunks = [0_u8; N];
        let mut carry = 0_u16;
        for i in 0..N {
            let self_chunk = self.chunks[i] as u16;
            let to_remove = other.chunks[i] as u16 + carry;
            let remove_from =
                if self_chunk >= to_remove {
                    carry = 0;
                    self_chunk
                } else {
                    carry = 1;
                    self_chunk + 0x100
                };
            require!(remove_from >= to_remove, "Unexpected value in subtraction");
            let result = remove_from - to_remove;
            require!(result <= 0xff, "Unexpected value in subtraction");
            chunks[i] = result as u8;
        }
        require!(carry == 0, "Subtraction overflow");
        Unsigned { chunks }
    }
}
impl<const N: usize> Sub for Unsigned<N> {
    type Output = Unsigned<N>;
    fn sub(self, other: Unsigned<N>) -> Self::Output {
        &self - &other
    }
}
impl<const N: usize> Sub<Unsigned<N>> for &Unsigned<N> {
    type Output = Unsigned<N>;
    fn sub(self, other: Unsigned<N>) -> Self::Output {
        self - &other
    }
}
impl<const N: usize> Sub<&Unsigned<N>> for Unsigned<N> {
    type Output = Unsigned<N>;
    fn sub(self, other: &Unsigned<N>) -> Self::Output {
        &self - other
    }
}

impl<const N: usize> Ord for Unsigned<N> {
    fn cmp(&self, other: &Self) -> Ordering {
        for i in (0..N).rev() {
            if self.chunks[i] < other.chunks[i] {
                return Ordering::Less;
            }
            if self.chunks[i] > other.chunks[i] {
                return Ordering::Greater;
            }
        }
        Ordering::Equal
    }
}
impl<const N: usize> PartialOrd for Unsigned<N> {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}
impl<const N: usize> PartialEq for Unsigned<N> {
    fn eq(&self, other: &Self) -> bool {
        self.cmp(other) == Ordering::Equal
    }
}
impl<const N: usize> Eq for Unsigned<N> {}
impl<const N: usize> Clone for Unsigned<N> {
    fn clone(&self) -> Self {
        Unsigned { chunks: self.chunks.clone() }
    }
}
