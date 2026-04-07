from __future__ import annotations

import struct
from typing import TYPE_CHECKING

from .utils import read_bytes

if TYPE_CHECKING:
    from .utils import InputStream


def f32(s: InputStream) -> float:
    bs = read_bytes(4, s)
    f = struct.unpack('<f', bs)[0]
    return f


def f64(s: InputStream) -> float:
    bs = read_bytes(8, s)
    f = struct.unpack('<d', bs)[0]
    return f
