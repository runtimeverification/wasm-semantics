from __future__ import annotations

from typing import TYPE_CHECKING

import pytest
from pyk.kast.inner import KApply
from wasm.datatypes import ExternAddress, FunctionAddress, Limits, Table, TableType

from pykwasm import wasm2kast
from pykwasm.kwasm_ast import KInt, externref, funcref

if TYPE_CHECKING:
    from pyk.kast import KInner


TABLE_TEST_DATA = (
    (Table(TableType(Limits(0, None), FunctionAddress)), KApply('limitsMin', [KInt(0)]), funcref),
    (Table(TableType(Limits(0, 100), ExternAddress)), KApply('limitsMinMax', [KInt(0), KInt(100)]), externref),
)


@pytest.mark.parametrize(('input', 'limits', 'typ'), TABLE_TEST_DATA)
def test_table(input: Table, limits: KInner, typ: KInner) -> None:
    # When
    t = wasm2kast.table(input)

    # Then
    assert limits == t.args[0]
    assert typ == t.args[1]
