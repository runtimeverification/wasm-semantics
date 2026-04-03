from __future__ import annotations

from typing import TYPE_CHECKING

import pykwasm.kwasm_ast as wast
from pykwasm.binary.combinators import list_of
from pykwasm.binary.floats import f32, f64
from pykwasm.binary.indices import elemidx, funcidx, globalidx, labelidx, localidx, memidx, tableidx, typeidx
from pykwasm.binary.integers import i32, i64, u32, u64
from pykwasm.binary.types import heaptype, valtype
from pykwasm.binary.utils import WasmParseError, expect_bytes, peek_byte, read_byte, skip

if TYPE_CHECKING:
    from pyk.kast.inner import KInner

    from pykwasm.binary.utils import InputStream


def instr_seq(terminator: int, s: InputStream) -> list[KInner]:
    res: list[KInner] = []

    while peek_byte(s) != terminator:
        i = instr(s)
        res.append(i)

    expect_bytes(bytes([terminator]), s)
    return res


def instr(s: InputStream) -> KInner:
    def blocktype(s: InputStream) -> KInner:
        if peek_byte(s) == 0x40:
            skip(1, s)
            return wast.vec_type(wast.val_types([]))

        try:
            t = valtype(s)
            return wast.vec_type(wast.val_types([t]))
        except WasmParseError as e:
            # TODO handle the `blocktype ::= i:i33` case
            raise WasmParseError('Could not parse blocktype') from e

    # returns memory index, alignment, offset
    def memarg(s: InputStream) -> tuple[int, int, int]:
        n = u32(s)
        if n < 2**6:
            m = u64(s)
            return 0, n, m
        elif n < 2**7:
            x = memidx(s)
            m = u64(s)
            return x, n - 2**6, m
        else:
            raise WasmParseError(f'Invalid memarg. n: {n}')

    opcode = read_byte(s)
    # '0xFC' is a special opcode prefix shared by several instructions.
    # These instructions are distinguished by a u32 value following the opcode.
    additional_value: int | None = None
    if opcode == 0xFC:
        try:
            additional_value = u32(s)
        except Exception as e:
            raise WasmParseError('Cannot parse opcode, expected u32 after 0xFC') from e

    match opcode:
        # Parametric instructions
        case 0x00:
            return wast.UNREACHABLE
        case 0x01:
            return wast.NOP
        case 0x1A:
            return wast.DROP
        case 0x1B:
            return wast.SELECT
        case 0x1C:
            # TODO handle ts
            ts = list_of(valtype, s)  # noqa F841
            return wast.SELECT

        # Control instructions
        case 0x02:
            bt = blocktype(s)
            ins = instr_seq(0x0B, s)
            return wast.BLOCK(bt, wast.instrs(ins), wast.KInt(0))  # TODO either track block ids or deprecate them
        case 0x03:
            bt = blocktype(s)
            ins = instr_seq(0x0B, s)
            return wast.LOOP(bt, wast.instrs(ins), wast.KInt(0))  # TODO either track block ids or deprecate them
        case 0x04:
            bt = blocktype(s)
            in1 = instr_seq(0x05, s)
            in2 = instr_seq(0x0B, s)
            return wast.IF(
                bt, wast.instrs(in1), wast.instrs(in2), wast.KInt(0)
            )  # TODO either track block ids or deprecate them
        case 0x0C:
            l = labelidx(s)
            return wast.BR(l)
        case 0x0D:
            l = labelidx(s)
            return wast.BR_IF(l)
        case 0x0E:
            ls = list_of(labelidx, s)
            ln = labelidx(s)
            return wast.BR_TABLE(tuple(ls), ln)
        case 0x0F:
            return wast.RETURN
        case 0x10:
            x = funcidx(s)
            return wast.CALL(x)
        case 0x11:
            y = typeidx(s)
            x = tableidx(s)
            return wast.CALL_INDIRECT(x, y)

        # Variable instructions
        case 0x20:
            x = localidx(s)
            return wast.GET_LOCAL(x)
        case 0x21:
            x = localidx(s)
            return wast.SET_LOCAL(x)
        case 0x22:
            x = localidx(s)
            return wast.TEE_LOCAL(x)
        case 0x23:
            x = globalidx(s)
            return wast.GET_GLOBAL(x)
        case 0x24:
            x = globalidx(s)
            return wast.SET_GLOBAL(x)

        # Table instructions
        case 0x25:
            x = tableidx(s)
            return wast.TABLE_GET(x)
        case 0x26:
            x = tableidx(s)
            return wast.TABLE_SET(x)
        case 0xFC if additional_value == 12:
            y = elemidx(s)
            x = tableidx(s)
            return wast.TABLE_INIT(x, y)
        case 0xFC if additional_value == 13:
            x = elemidx(s)
            return wast.ELEM_DROP(x)
        case 0xFC if additional_value == 14:
            x1 = tableidx(s)
            x2 = tableidx(s)
            return wast.TABLE_COPY(x1, x2)
        case 0xFC if additional_value == 15:
            x = tableidx(s)
            return wast.TABLE_GROW(x)
        case 0xFC if additional_value == 16:
            x = tableidx(s)
            return wast.TABLE_SIZE(x)
        case 0xFC if additional_value == 17:
            x = tableidx(s)
            return wast.TABLE_FILL(x)

        # Memory instructions
        # TODO handle memory index and alignment
        case 0x28:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_LOAD(offset)
        case 0x29:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD(offset)
        case 0x2A:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.F32_LOAD(offset)
        case 0x2B:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.F64_LOAD(offset)
        case 0x2C:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_LOAD8_S(offset)
        case 0x2D:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_LOAD8_U(offset)
        case 0x2E:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_LOAD16_S(offset)
        case 0x2F:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_LOAD16_U(offset)
        case 0x30:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD8_S(offset)
        case 0x31:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD8_U(offset)
        case 0x32:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD16_S(offset)
        case 0x33:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD16_U(offset)
        case 0x34:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD32_S(offset)
        case 0x35:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_LOAD32_U(offset)
        case 0x36:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_STORE(offset)
        case 0x37:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_STORE(offset)
        case 0x38:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.F32_STORE(offset)
        case 0x39:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.F64_STORE(offset)
        case 0x3A:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_STORE8(offset)
        case 0x3B:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I32_STORE16(offset)
        case 0x3C:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_STORE8(offset)
        case 0x3D:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_STORE16(offset)
        case 0x3E:
            mx, align, offset = memarg(s)  # noqa F841
            return wast.I64_STORE32(offset)
        case 0x3F:
            # TODO use memory index
            _x = memidx(s)  # noqa 841
            return wast.MEMORY_SIZE
        case 0x40:
            # TODO use memory index
            _x = memidx(s)  # noqa 841
            return wast.MEMORY_GROW

        # Reference instructions
        case 0xD0:
            ht = heaptype(s)
            return wast.REF_NULL(ht)
        case 0xD1:
            return wast.REF_IS_NULL
        case 0xD2:
            x = funcidx(s)
            return wast.REF_FUNC(x)

        # Numeric instructions
        # Constants
        case 0x41:
            i = i32(s)
            return wast.I32_CONST(i)
        case 0x42:
            i = i64(s)
            return wast.I64_CONST(i)
        case 0x43:
            f = f32(s)
            return wast.F32_CONST(f)
        case 0x44:
            f = f64(s)
            return wast.F64_CONST(f)

        # i32 comparison
        case 0x45:
            return wast.I32_EQZ
        case 0x46:
            return wast.I32_EQ
        case 0x47:
            return wast.I32_NE
        case 0x48:
            return wast.I32_LT_S
        case 0x49:
            return wast.I32_LT_U
        case 0x4A:
            return wast.I32_GT_S
        case 0x4B:
            return wast.I32_GT_U
        case 0x4C:
            return wast.I32_LE_S
        case 0x4D:
            return wast.I32_LE_U
        case 0x4E:
            return wast.I32_GE_S
        case 0x4F:
            return wast.I32_GE_U

        # i64 comparison
        case 0x50:
            return wast.I64_EQZ
        case 0x51:
            return wast.I64_EQ
        case 0x52:
            return wast.I64_NE
        case 0x53:
            return wast.I64_LT_S
        case 0x54:
            return wast.I64_LT_U
        case 0x55:
            return wast.I64_GT_S
        case 0x56:
            return wast.I64_GT_U
        case 0x57:
            return wast.I64_LE_S
        case 0x58:
            return wast.I64_LE_U
        case 0x59:
            return wast.I64_GE_S
        case 0x5A:
            return wast.I64_GE_U

        # f32 comparison
        case 0x5B:
            return wast.F32_EQ
        case 0x5C:
            return wast.F32_NE
        case 0x5D:
            return wast.F32_LT
        case 0x5E:
            return wast.F32_GT
        case 0x5F:
            return wast.F32_LE
        case 0x60:
            return wast.F32_GE

        # f64 comparison
        case 0x61:
            return wast.F64_EQ
        case 0x62:
            return wast.F64_NE
        case 0x63:
            return wast.F64_LT
        case 0x64:
            return wast.F64_GT
        case 0x65:
            return wast.F64_LE
        case 0x66:
            return wast.F64_GE

        # i32 unary / binary
        case 0x67:
            return wast.I32_CLZ
        case 0x68:
            return wast.I32_CTZ
        case 0x69:
            return wast.I32_POPCNT
        case 0x6A:
            return wast.I32_ADD
        case 0x6B:
            return wast.I32_SUB
        case 0x6C:
            return wast.I32_MUL
        case 0x6D:
            return wast.I32_DIV_S
        case 0x6E:
            return wast.I32_DIV_U
        case 0x6F:
            return wast.I32_REM_S
        case 0x70:
            return wast.I32_REM_U
        case 0x71:
            return wast.I32_AND
        case 0x72:
            return wast.I32_OR
        case 0x73:
            return wast.I32_XOR
        case 0x74:
            return wast.I32_SHL
        case 0x75:
            return wast.I32_SHR_S
        case 0x76:
            return wast.I32_SHR_U
        case 0x77:
            return wast.I32_ROTL
        case 0x78:
            return wast.I32_ROTR

        # i64 unary / binary
        case 0x79:
            return wast.I64_CLZ
        case 0x7A:
            return wast.I64_CTZ
        case 0x7B:
            return wast.I64_POPCNT
        case 0x7C:
            return wast.I64_ADD
        case 0x7D:
            return wast.I64_SUB
        case 0x7E:
            return wast.I64_MUL
        case 0x7F:
            return wast.I64_DIV_S
        case 0x80:
            return wast.I64_DIV_U
        case 0x81:
            return wast.I64_REM_S
        case 0x82:
            return wast.I64_REM_U
        case 0x83:
            return wast.I64_AND
        case 0x84:
            return wast.I64_OR
        case 0x85:
            return wast.I64_XOR
        case 0x86:
            return wast.I64_SHL
        case 0x87:
            return wast.I64_SHR_S
        case 0x88:
            return wast.I64_SHR_U
        case 0x89:
            return wast.I64_ROTL
        case 0x8A:
            return wast.I64_ROTR

        # f32 unary / binary
        case 0x8B:
            return wast.F32_ABS
        case 0x8C:
            return wast.F32_NEG
        case 0x8D:
            return wast.F32_CEIL
        case 0x8E:
            return wast.F32_FLOOR
        case 0x8F:
            return wast.F32_TRUNC
        case 0x90:
            return wast.F32_NEAREST
        case 0x91:
            return wast.F32_SQRT
        case 0x92:
            return wast.F32_ADD
        case 0x93:
            return wast.F32_SUB
        case 0x94:
            return wast.F32_MUL
        case 0x95:
            return wast.F32_DIV
        case 0x96:
            return wast.F32_MIN
        case 0x97:
            return wast.F32_MAX
        case 0x98:
            return wast.F32_COPYSIGN

        # f64 unary / binary
        case 0x99:
            return wast.F64_ABS
        case 0x9A:
            return wast.F64_NEG
        case 0x9B:
            return wast.F64_CEIL
        case 0x9C:
            return wast.F64_FLOOR
        case 0x9D:
            return wast.F64_TRUNC
        case 0x9E:
            return wast.F64_NEAREST
        case 0x9F:
            return wast.F64_SQRT
        case 0xA0:
            return wast.F64_ADD
        case 0xA1:
            return wast.F64_SUB
        case 0xA2:
            return wast.F64_MUL
        case 0xA3:
            return wast.F64_DIV
        case 0xA4:
            return wast.F64_MIN
        case 0xA5:
            return wast.F64_MAX
        case 0xA6:
            return wast.F64_COPYSIGN

        # conversion instructions
        case 0xA7:
            return wast.I32_WRAP_I64
        case 0xA8:
            return wast.I32_TRUNC_S_F32
        case 0xA9:
            return wast.I32_TRUNC_U_F32
        case 0xAA:
            return wast.I32_TRUNC_S_F64
        case 0xAB:
            return wast.I32_TRUNC_U_F64
        case 0xAC:
            return wast.I64_EXTEND_S_I32
        case 0xAD:
            return wast.I64_EXTEND_U_I32
        case 0xAE:
            return wast.I64_TRUNC_S_F32
        case 0xAF:
            return wast.I64_TRUNC_U_F32
        case 0xB0:
            return wast.I64_TRUNC_S_F64
        case 0xB1:
            return wast.I64_TRUNC_U_F64
        case 0xB2:
            return wast.F32_CONVERT_S_I32
        case 0xB3:
            return wast.F32_CONVERT_U_I32
        case 0xB4:
            return wast.F32_CONVERT_S_I64
        case 0xB5:
            return wast.F32_CONVERT_U_I64
        case 0xB6:
            return wast.F32_DEMOTE_F64
        case 0xB7:
            return wast.F64_CONVERT_S_I32
        case 0xB8:
            return wast.F64_CONVERT_U_I32
        case 0xB9:
            return wast.F64_CONVERT_S_I64
        case 0xBA:
            return wast.F64_CONVERT_U_I64
        case 0xBB:
            return wast.F64_PROMOTE_F32

        # sign-extension instructions
        case 0xC0:
            return wast.I32_EXTEND8_s
        case 0xC1:
            return wast.I32_EXTEND16_s
        case 0xC2:
            return wast.I64_EXTEND8_s
        case 0xC3:
            return wast.I64_EXTEND16_s
        case 0xC4:
            return wast.I64_EXTEND32_s

        # Handle unsupported opcodes
        case _:
            raise WasmParseError(f'Unsupported opcode: {opcode :#04x}, {additional_value}')


def expr(s: InputStream) -> list[KInner]:
    return instr_seq(0x0B, s)
