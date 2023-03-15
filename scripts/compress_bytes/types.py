from typing import List

class ValType:
    def __init__(self, ktype:int) -> None:
        self.__type = ktype

    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        if self == ValType.I32:
            return 'ValType.I32'
        if self == ValType.I64:
            return 'ValType.I64'
        if self == ValType.F32:
            return 'ValType.F32'
        if self == ValType.F64:
            return 'ValType.F64'

class ValType:
    (I32, I64, F32, F64) = (ValType(i) for i in range(0, 4))

class VecType:
    def __init__(self, types:List[ValType]) -> None:
        self.__types = types

    def types(self) -> List[ValType]:
        return self.__types

    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        return f'VecType(types={repr(self.__types)})'

class FuncType:
    def __init__(self, arg_types: VecType, result_types: VecType) -> None:
        self.__arg_types = arg_types
        self.__result_types = result_types

    def argumentTypesList(self) -> List[ValType]:
        return self.__arg_types.types()

    def __str__(self) -> str:
        return repr(self)
    
    def __repr__(self) -> str:
        return f'FuncType(arg_types={repr(self.__arg_types)}, result_types={repr(self.__result_types)})'
