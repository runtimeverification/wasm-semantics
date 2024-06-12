
requires "int-type.k"
// requires "int-type.k"
requires "list-int.k"

module MAP-INT-TO-INT
  imports private BOOL-SYNTAX
  imports private INT-SYNTAX
  imports private LIST-INT
  imports private LIST-INT
  // imports private LIST
  // imports private SET-INT
  imports private SET
  imports INT-TYPE
  imports INT-TYPE

  syntax Int
  syntax Int

  syntax MapIntToInt [hook(MAP.Map)]
  syntax MapIntToInt ::= MapIntToInt MapIntToInt
         [ left, function, hook(MAP.concat), symbol(_MapIntToInt_),
           assoc, comm, unit(.MapIntToInt), element(_Int2Int|->_),
           index(0), format(%1%n%2)
         ]
  syntax MapIntToInt ::= ".MapIntToInt"
         [ function, total, hook(MAP.unit),
           symbol(.MapIntToInt)
         ]
  syntax MapIntToInt ::= WrappedInt "Int2Int|->" WrappedInt
         [ function, total, hook(MAP.element),
           symbol(_Int2Int|->_),
           injective
         ]

  syntax priority _Int2Int|->_ > _MapIntToInt_ .MapIntToInt
  syntax non-assoc _Int2Int|->_
  syntax WrappedInt ::= MapIntToInt "[" WrappedInt "]"
                 [function, hook(MAP.lookup), symbol(MapIntToInt:lookup)]
  syntax WrappedInt ::= MapIntToInt "[" WrappedInt "]" "orDefault" WrappedInt
                 [ function, total, hook(MAP.lookupOrDefault),
                   symbol(MapIntToInt:lookupOrDefault)
                 ]
  syntax MapIntToInt ::= MapIntToInt "[" key: WrappedInt "<-" value: WrappedInt "]"
                 [ function, total, symbol(MapIntToInt:update),
                   hook(MAP.update), prefer
                 ]
  syntax MapIntToInt ::= MapIntToInt "[" WrappedInt "<-" "undef" "]"
                 [ function, total, hook(MAP.remove),
                   symbol(_MapIntToInt[_<-undef])
                 ]
  syntax MapIntToInt ::= MapIntToInt "-Map" MapIntToInt
                 [ function, total, hook(MAP.difference) ]
  syntax MapIntToInt ::= updateMap(MapIntToInt, MapIntToInt)
                 [function, total, hook(MAP.updateAll)]

  syntax MapIntToInt ::= removeAll(MapIntToInt, Set)
                 [function, total, hook(MAP.removeAll)]
  // syntax MapIntToInt ::= removeAll(MapIntToInt, SetInt)
  //                [function, total, hook(MAP.removeAll)]

  syntax Set ::= keys(MapIntToInt)
                 [function, total, hook(MAP.keys)]
  // syntax SetInt ::= keys(MapIntToInt)
  //                [function, total, hook(MAP.keys)]

  // syntax List ::= "keys_list" "(" MapIntToInt ")"
  //                [function, hook(MAP.keys_list)]
  syntax ListInt ::= "keys_list" "(" MapIntToInt ")"
                 [function, hook(MAP.keys_list)]

  syntax Bool ::= WrappedInt "in_keys" "(" MapIntToInt ")"
                 [function, total, hook(MAP.in_keys)]

  // syntax List ::= values(MapIntToInt)
  //                [function, hook(MAP.values)]
  syntax ListInt ::= values(MapIntToInt)
                 [function, hook(MAP.values)]

  syntax Int ::= size(MapIntToInt)
                 [function, total, hook(MAP.size), symbol(MapIntToInt.sizeMap)]
  syntax Bool ::= MapIntToInt "<=Map" MapIntToInt
                 [function, total, hook(MAP.inclusion)]
  syntax WrappedInt ::= choice(MapIntToInt)
                 [function, hook(MAP.choice), symbol(MapIntToInt:choice)]
endmodule

module MAP-INT-TO-INT-PRIMITIVE
  imports public  BOOL
  imports private K-EQUAL
  imports public  MAP-INT-TO-INT

  syntax Int ::= MapIntToInt "{{" Int "}}"
                 [function, symbol(MapIntToInt:primitiveLookup)]
  syntax Int ::= MapIntToInt "{{" Int "}}" "orDefault" Int
                 [ function, total, symbol(MapIntToInt:primitiveLookupOrDefault) ]
  syntax MapIntToInt ::= MapIntToInt "{{" key: Int "<-" value: Int "}}"
                 [ function, total, symbol(MapIntToInt:primitiveUpdate),
                   prefer
                 ]
  syntax MapIntToInt ::= MapIntToInt "{{" Int "<-" "undef" "}}"
                 [ function, total, symbol(MapIntToInt:primitiveRemove) ]
  syntax Bool ::= Int "in_keys" "{{" MapIntToInt "}}"
                 [function, total, symbol(MapIntToInt:primitiveInKeys)]

  rule (M:MapIntToInt {{ Key:Int }})
      => (unwrap( M[wrap(Key)] ))
  rule M:MapIntToInt {{ Key:Int }} orDefault Value:Int
      => unwrap( M[wrap(Key)] orDefault wrap(Value) )
  rule M:MapIntToInt {{ Key:Int <- Value:Int }}
      => M[wrap(Key) <- wrap(Value)]
  rule M:MapIntToInt {{ Key:Int <- undef }}
      => M[wrap(Key) <- undef]
  rule Key:Int in_keys {{ M:MapIntToInt }} => wrap(Key) in_keys(M)
endmodule

module MAP-INT-TO-INT-SYMBOLIC
  imports MAP-INT-TO-INT-KORE-SYMBOLIC
endmodule

module MAP-INT-TO-INT-KORE-SYMBOLIC  [symbolic]
  imports MAP-INT-TO-INT
  imports private K-EQUAL
  imports private BOOL

  rule #Ceil(@M:MapIntToInt [@K:WrappedInt])
      => {(@K in_keys(@M)) #Equals true}
          #And #Ceil(@M) #And #Ceil(@K)
      [simplification]

  rule (K Int2Int|-> _ M:MapIntToInt) [ K <- V ] => (K Int2Int|-> V M)
      [simplification, preserves-definedness]
  rule M:MapIntToInt [ K <- V ] => (K Int2Int|-> V M) requires notBool (K in_keys(M))
      [simplification, preserves-definedness]
  rule M:MapIntToInt [ K <- _ ] [ K <- V ] => M [ K <- V ] [simplification]
  // Adding the definedness condition `notBool (K1 in_keys(M))` in the ensures clause of the following rule would be redundant
  // because K1 also appears in the rhs, preserving the case when it's #Bottom.
  rule (K1 Int2Int|-> V1 M:MapIntToInt) [ K2 <- V2 ] => (K1 Int2Int|-> V1 (M [ K2 <- V2 ]))
      requires K1 =/=K K2
      [simplification, preserves-definedness]

  // Symbolic remove
  rule (K Int2Int|-> _ M:MapIntToInt) [ K <- undef ] => M
      ensures notBool (K in_keys(M))
      [simplification]
  rule M:MapIntToInt [ K <- undef ] => M
      requires notBool (K in_keys(M))
      [simplification]
  // Adding the definedness condition `notBool (K1 in_keys(M))` in the ensures clause of the following rule would be redundant
  // because K1 also appears in the rhs, preserving the case when it's #Bottom.
  rule (K1 Int2Int|-> V1 M:MapIntToInt) [ K2 <- undef ]
      => (K1 Int2Int|-> V1 (M [ K2 <- undef ]))
      requires K1 =/=K K2
      [simplification, preserves-definedness]

  // Symbolic lookup
  rule (K  Int2Int|->  V M:MapIntToInt) [ K ] => V
      ensures notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Int|-> _V M:MapIntToInt) [ K2 ] => M [K2]
      requires K1 =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToInt [ K  <-  V1 ]) [ K ]  => V1 [simplification]
  rule ( MAP:MapIntToInt [ K1 <- _V1 ]) [ K2 ] => MAP [ K2 ]
      requires K1 =/=K K2
      [simplification]

  rule (K  Int2Int|->  V M:MapIntToInt) [  K ] orDefault _ => V
      ensures notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Int|-> _V M:MapIntToInt) [ K2 ] orDefault D
      => M [K2] orDefault D
      requires K1 =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToInt [ K  <-  V1 ]) [ K ] orDefault _ => V1 [simplification]
  rule ( MAP:MapIntToInt [ K1 <- _V1 ]) [ K2 ] orDefault D
      => MAP [ K2 ] orDefault D
      requires K1 =/=K K2
      [simplification]
  rule .MapIntToInt [ _ ] orDefault D => D [simplification]

  // Symbolic in_keys
  rule K in_keys(_M:MapIntToInt [ K <- undef ]) => false [simplification]
  rule K in_keys(_M:MapIntToInt [ K <- _ ]) => true [simplification]
  rule K1 in_keys(M:MapIntToInt [ K2 <- _ ])
      => true requires K1 ==K K2 orBool K1 in_keys(M)
      [simplification]
  rule K1 in_keys(M:MapIntToInt [ K2 <- _ ])
      => K1 in_keys(M)
      requires K1 =/=K K2
      [simplification]

  rule K in_keys((K Int2Int|-> _V) M:MapIntToInt)
      => true
    requires notBool K in_keys(M)
    [simplification(50), preserves-definedness]
  rule K1 in_keys((K2 Int2Int|-> _V) M:MapIntToInt)
      => K1 in_keys(M)
    requires true
        andBool (notBool K2 in_keys(M))
        andBool K1 =/=K K2
    [simplification(50), preserves-definedness]
  rule K1 in_keys((K2 Int2Int|-> _V) M:MapIntToInt)
      => K1 ==K K2 orBool K1 in_keys(M)
    requires notBool K2 in_keys(M)
    [simplification(100), preserves-definedness]


  rule {false #Equals @Key in_keys(.MapIntToInt)} => #Ceil(@Key) [simplification]
  rule {@Key in_keys(.MapIntToInt) #Equals false} => #Ceil(@Key) [simplification]
  rule {false #Equals @Key in_keys(Key' Int2Int|-> Val @M:MapIntToInt)}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Int|-> Val @M)
          #And #Not({@Key #Equals Key'})
          #And {false #Equals @Key in_keys(@M)}
      [simplification]
  rule {@Key in_keys(Key' Int2Int|-> Val @M:MapIntToInt) #Equals false}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Int|-> Val @M)
          #And #Not({@Key #Equals Key'})
          #And {@Key in_keys(@M) #Equals false}
      [simplification]
endmodule
