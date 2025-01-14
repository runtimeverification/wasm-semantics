

module LIST-REF
  imports WASM-DATA-INTERNAL-SYNTAX
  imports private INT-SYNTAX
  imports private BASIC-K

  syntax Int

  syntax ListRef [hook(LIST.List)]
  syntax ListRef ::= ListRef ListRef
          [ left, function, total, hook(LIST.concat),
            symbol(_ListRef_), smtlib(smt_seq_concat),
            assoc, unit(.ListRef), element(ListRefItem),
            format(%1%n%2), update(ListRef:set)
          ]
  syntax ListRef ::= ".ListRef"
          [ function, total, hook(LIST.unit), symbol(.ListRef),
            smtlib(smt_seq_nil)
          ]
  syntax ListRef ::= ListItem(RefVal)
          [ function, total, hook(LIST.element), symbol(ListRefItem),
            smtlib(smt_seq_elem)
          ]
  syntax RefVal ::= ListRef "[" Int "]"
          [ function, hook(LIST.get), symbol(ListRef:get) ]
  syntax ListRef ::= ListRef "[" index: Int "<-" value: RefVal "]"
          [function, hook(LIST.update), symbol(ListRef:set)]
  syntax ListRef ::= makeListRef(length: Int, value: RefVal)
          [function, hook(LIST.make)]
  syntax ListRef ::= updateList(dest: ListRef, index: Int, src: ListRef)
          [function, hook(LIST.updateAll)]
  syntax ListRef ::= fillList(ListRef, index: Int, length: Int, value: RefVal)
          [function, hook(LIST.fill)]
  syntax ListRef ::= range(ListRef, fromFront: Int, fromBack: Int)
          [function, hook(LIST.range), symbol(ListRef:range)]
  syntax Bool ::= RefVal "in" ListRef
          [function, total, hook(LIST.in), symbol(_inListRef_)]
  syntax Int ::= size(ListRef)
          [function, total, hook(LIST.size), symbol(sizeListRef), smtlib(smt_seq_len)]
endmodule

module LIST-REF-EXTENSIONS
  imports LIST-REF
  imports BOOL
  imports INT

  syntax RefVal ::= ListRef "[" Int "]" "orDefault" RefVal
          [ function, total, symbol(ListRef:getOrDefault) ]
// ----------------------------------------------------------------
  rule ListItem(V:RefVal) _:ListRef [0] orDefault _:RefVal
      => V
  rule _:ListRef ListItem(V:RefVal) [-1] orDefault _:RefVal
      => V
  rule .ListRef [_:Int] orDefault D:RefVal => D

  rule ListItem(_:RefVal) L:ListRef [I:Int] orDefault D:RefVal
      => L[I -Int 1] orDefault D
    requires 0 <Int I
  rule L:ListRef ListItem(_:RefVal) [I:Int] orDefault D:RefVal
      => L[I +Int 1] orDefault D
    requires I <Int 0

  rule L:ListRef[I:Int] orDefault D:RefVal => D
    requires notBool (0 -Int size(L) <=Int I andBool I <Int size(L))
    [simplification]

  syntax RefVal ::= getRefOrNull(ListRef, Int)
          [ function, total, symbol(ListRef:getOrNull) ]
// -------------------------------------------------------------
  rule getRefOrNull(L, N) => L [N] orDefault (<funcref> null)

  syntax ListRef ::= makeListRefTotal(Int, RefVal)
      [function, total, symbol(ListRef:makeTotal)]
// ----------------------------------------------------
  rule makeListRefTotal(N, V) => makeListRef(N, V)
    requires N >=Int 0
  rule makeListRefTotal(N, _) => .ListRef
    requires N <Int 0
  
  syntax ListRef ::= dropListRef(Int, ListRef)
      [function, total, symbol(ListRef:drop)]
// --------------------------------------------------------------
  rule dropListRef(N, ListItem(_) L) => dropListRef(N -Int 1, L)
    requires N >Int 0
  rule dropListRef(_, L)             => L
    [owise]
  
endmodule
