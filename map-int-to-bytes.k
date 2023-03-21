module MAP-INTW-TO-BYTESW
  imports private BOOL-SYNTAX
  imports private INT-SYNTAX
  // imports private LIST-INTW
  // imports private LIST-BYTESW
  imports private LIST
  // imports private SET-INTW
  imports private SET

  syntax Intw
  syntax Bytesw

  syntax MapIntwToBytesw [hook(MAP.Map)]
  syntax MapIntwToBytesw ::= MapIntwToBytesw MapIntwToBytesw
         [ left, function, hook(MAP.concat), klabel(_MapIntwToBytesw_),
           symbol, assoc, comm, unit(.MapIntwToBytesw), element(_Int2Bytes|->_),
           index(0), format(%1%n%2)
         ]
  syntax MapIntwToBytesw ::= ".MapIntwToBytesw"
         [ function, total, hook(MAP.unit),
           klabel(.MapIntwToBytesw), symbol, latex(\dotCt{MapIntwToBytesw})
         ]
  syntax MapIntwToBytesw ::= Intw "Int2Bytes|->" Bytesw
         [ function, total, hook(MAP.element),
           klabel(_Int2Bytes|->_), symbol,
           latex({#1}\mapsto{#2}), injective
         ]

  syntax priorities _Int2Bytes|->_ > _MapIntwToBytesw_ .MapIntwToBytesw
  syntax non-assoc _Int2Bytes|->_
  syntax Bytesw ::= MapIntwToBytesw "[" Intw "]"
                 [function, hook(MAP.lookup), klabel(MapIntwToBytesw:lookup), symbol]
  syntax Bytesw ::= MapIntwToBytesw "[" Intw "]" "orDefault" Bytesw
                 [ function, total, hook(MAP.lookupOrDefault),
                   klabel(MapIntwToBytesw:lookupOrDefault)
                 ]
  syntax Bytesw ::= stuff(MapIntwToBytesw, Intw, Bytesw)
                 [ function, total, hook(MAP.lookupOrDefault),
                   klabel(MapIntwToBytesw:lookupOrDefault)
                 ]
  syntax MapIntwToBytesw ::= MapIntwToBytesw "[" key: Intw "<-" value: Bytesw "]"
                 [ function, total, klabel(MapIntwToBytesw:update), symbol,
                   hook(MAP.update), prefer
                 ]
  syntax MapIntwToBytesw ::= MapIntwToBytesw "[" Intw "<-" "undef" "]"
                 [ function, total, hook(MAP.remove),
                   klabel(_MapIntwToBytesw[_<-undef]), symbol
                 ]
  syntax MapIntwToBytesw ::= MapIntwToBytesw "-Map" MapIntwToBytesw
                 [ function, total, hook(MAP.difference),
                   latex({#1}-_{\it MapIntwToByteswMap}{#2})
                 ]
  syntax MapIntwToBytesw ::= updateMap(MapIntwToBytesw, MapIntwToBytesw)
                 [function, total, hook(MAP.updateAll)]

  syntax MapIntwToBytesw ::= removeAll(MapIntwToBytesw, Set)
                 [function, total, hook(MAP.removeAll)]
  // syntax MapIntwToBytesw ::= removeAll(MapIntwToBytesw, SetIntw)
  //                [function, total, hook(MAP.removeAll)]

  syntax Set ::= keys(MapIntwToBytesw)
                 [function, total, hook(MAP.keys)]
  // syntax SetIntw ::= keys(MapIntwToBytesw)
  //                [function, total, hook(MAP.keys)]

  syntax List ::= "keys_list" "(" MapIntwToBytesw ")"
                 [function, hook(MAP.keys_list)]
  // syntax ListIntw ::= "keys_list" "(" MapIntwToBytesw ")"
  //                [function, hook(MAP.keys_list)]

  syntax Bool ::= Intw "in_keys" "(" MapIntwToBytesw ")"
                 [function, total, hook(MAP.in_keys)]

  syntax List ::= values(MapIntwToBytesw)
                 [function, hook(MAP.values)]
  // syntax ListBytesw ::= values(MapIntwToBytesw)
  //                [function, hook(MAP.values)]

  syntax Int ::= size(MapIntwToBytesw)
                 [function, total, hook(MAP.size), klabel(MapIntwToBytesw.sizeMap)]
  syntax Bool ::= MapIntwToBytesw "<=Map" MapIntwToBytesw
                 [function, total, hook(MAP.inclusion)]
  syntax Intw ::= choice(MapIntwToBytesw)
                 [function, hook(MAP.choice), klabel(MapIntwToBytesw:choice)]
endmodule

module MAP-INTW-TO-BYTESW-KORE-SYMBOLIC
  imports MAP-INTW-TO-BYTESW
  imports private K-EQUAL
  imports private BOOL

  rule #Ceil(@M:MapIntwToBytesw [@K:Intw])
      => {(@K in_keys(@M)) #Equals true}
          #And #Ceil(@M) #And #Ceil(@K)
      [simplification]

  rule (K Int2Bytes|-> _ M:MapIntwToBytesw) [ K <- V ] => (K Int2Bytes|-> V M) [simplification]
  rule M:MapIntwToBytesw [ K <- V ] => (K Int2Bytes|-> V M) requires notBool (K in_keys(M))
      [simplification]
  rule M:MapIntwToBytesw [ K <- _ ] [ K <- V ] => M [ K <- V ] [simplification]
  rule (K1 Int2Bytes|-> V1 M:MapIntwToBytesw) [ K2 <- V2 ] => (K1 Int2Bytes|-> V1 (M [ K2 <- V2 ]))
      requires K1 =/=K K2
      [simplification]

  rule (K Int2Bytes|-> _ M:MapIntwToBytesw) [ K <- undef ] => M
      ensures notBool (K in_keys(M))
      [simplification]
  rule M:MapIntwToBytesw [ K <- undef ] => M
      requires notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Bytes|-> V1 M:MapIntwToBytesw) [ K2 <- undef ]
      => (K1 Int2Bytes|-> V1 (M [ K2 <- undef ]))
      requires K1 =/=K K2
      [simplification]

  rule (K  Int2Bytes|->  V M:MapIntwToBytesw) [ K ] => V
      ensures notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Bytes|-> _V M:MapIntwToBytesw) [ K2 ] => M [K2]
      requires K1 =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntwToBytesw [ K  <-  V1 ]) [ K ]  => V1 [simplification]
  rule ( MAP:MapIntwToBytesw [ K1 <- _V1 ]) [ K2 ] => MAP [ K2 ]
      requires K1 =/=K K2
      [simplification]

  rule (K  Int2Bytes|->  V M:MapIntwToBytesw) [  K ] orDefault _ => V
      ensures notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Bytes|-> _V M:MapIntwToBytesw) [ K2 ] orDefault D
      => M [K2] orDefault D
      requires K1 =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntwToBytesw [ K  <-  V1 ]) [ K ] orDefault _ => V1 [simplification]
  rule ( MAP:MapIntwToBytesw [ K1 <- _V1 ]) [ K2 ] orDefault D
      => MAP [ K2 ] orDefault D
      requires K1 =/=K K2
      [simplification]
  rule .MapIntwToBytesw [ _ ] orDefault D => D [simplification]

  rule K in_keys(_M:MapIntwToBytesw [ K <- undef ]) => false [simplification]
  rule K in_keys(_M:MapIntwToBytesw [ K <- _ ]) => true [simplification]
  rule K1 in_keys(M:MapIntwToBytesw [ K2 <- _ ])
      => true requires K1 ==K K2 orBool K1 in_keys(M)
      [simplification]
  rule K1 in_keys(M:MapIntwToBytesw [ K2 <- _ ])
      => K1 in_keys(M)
      requires K1 =/=K K2
      [simplification]

  rule {false #Equals @Key in_keys(.MapIntwToBytesw)} => #Ceil(@Key) [simplification]
  rule {@Key in_keys(.MapIntwToBytesw) #Equals false} => #Ceil(@Key) [simplification]
  rule {false #Equals @Key in_keys(Key' Int2Bytes|-> Val @M:MapIntwToBytesw)}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Bytes|-> Val @M)
          #And #Not({@Key #Equals Key'})
          #And {false #Equals @Key in_keys(@M)}
      [simplification]
  rule {@Key in_keys(Key' Int2Bytes|-> Val @M:MapIntwToBytesw) #Equals false}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Bytes|-> Val @M)
          #And #Not({@Key #Equals Key'})
          #And {@Key in_keys(@M) #Equals false}
      [simplification]
endmodule
