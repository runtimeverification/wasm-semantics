

module LIST-REF
  import WASM-DATA-INTERNAL-SYNTAX
  imports private INT-SYNTAX
  imports private BASIC-K

  syntax Int

  syntax ListRef [hook(LIST.List)]
  syntax ListRef ::= ListRef ListRef
          [ left, function, total, hook(LIST.concat),
            klabel(_ListRef_), symbol, smtlib(smt_seq_concat),
            assoc, unit(.ListRef), element(ListRefItem),
            format(%1%n%2)
          ]
  syntax ListRef ::= ".ListRef"
          [ function, total, hook(LIST.unit), klabel(.ListRef),
            symbol, smtlib(smt_seq_nil), latex(\dotCt{ListRef})
          ]
  syntax ListRef ::= ListItem(RVal)
          [ function, total, hook(LIST.element), klabel(ListRefItem),
            symbol, smtlib(smt_seq_elem)
          ]
  syntax RVal ::= ListRef "[" Int "]"
          [ function, hook(LIST.get), klabel(ListRef:get), symbol ]
  syntax ListRef ::= ListRef "[" index: Int "<-" value: RVal "]"
          [function, hook(LIST.update), symbol, klabel(ListRef:set)]
  syntax ListRef ::= makeListRef(length: Int, value: RVal)
          [function, hook(LIST.make)]
  syntax ListRef ::= updateList(dest: ListRef, index: Int, src: ListRef)
          [function, hook(LIST.updateAll)]
  syntax ListRef ::= fillList(ListRef, index: Int, length: Int, value: RVal)
          [function, hook(LIST.fill)]
  syntax ListRef ::= range(ListRef, fromFront: Int, fromBack: Int)
          [function, hook(LIST.range), klabel(ListRef:range), symbol]
  syntax Bool ::= RVal "in" ListRef
          [function, total, hook(LIST.in), symbol, klabel(_inListRef_)]
  syntax Int ::= size(ListRef)
          [function, total, hook(LIST.size), symbol, klabel (sizeListRef), smtlib(smt_seq_len)]
endmodule

module LIST-REF-EXTENSIONS
  imports LIST-REF
  imports BOOL
  imports INT

  syntax RVal ::= ListRef "[" Int "]" "orDefault" RVal
          [ function, total, klabel(ListRef:getOrDefault), symbol ]
// ----------------------------------------------------------------
  rule ListItem(V:RVal) _:ListRef [0] orDefault _:RVal
      => V
  rule _:ListRef ListItem(V:RVal) [-1] orDefault _:RVal
      => V
  rule .ListRef [_:Int] orDefault D:RVal => D

  rule ListItem(_:RVal) L:ListRef [I:Int] orDefault D:RVal
      => L[I -Int 1] orDefault D
    requires 0 <Int I
  rule L:ListRef ListItem(_:RVal) [I:Int] orDefault D:RVal
      => L[I +Int 1] orDefault D
    requires I <Int 0

  rule L:ListRef[I:Int] orDefault D:RVal => D
    requires notBool (0 -Int size(L) <=Int I andBool I <Int size(L))
    [simplification]

  syntax RVal ::= getRefOrNull(ListRef, Int)
          [ function, total, klabel(ListRef:getOrNull), symbol ]
// -------------------------------------------------------------
  rule getRefOrNull(L, N) => L [N] orDefault (<funcref> null)

  syntax ListRef ::= makeListRefTotal(Int, RVal)
      [function, total, klabel(ListRef:makeTotal), symbol]
// ----------------------------------------------------
  rule makeListRefTotal(N, V) => makeListRef(N, V)
    requires N >=Int 0
  rule makeListRefTotal(N, _) => .ListRef
    requires N <Int 0
  
  syntax ListRef ::= dropListRef(Int, ListRef)
      [function, total, klabel(ListRef:drop), symbol]
// --------------------------------------------------------------
  rule dropListRef(N, ListItem(_) L) => dropListRef(N -Int 1, L)
    requires N >Int 0
  rule dropListRef(N, L)             => L
    [owise]
  
endmodule