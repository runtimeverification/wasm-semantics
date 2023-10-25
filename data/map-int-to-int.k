
require "int-type.k"
// require "int-type.k"
require "list-int.k"

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
         [ left, function, hook(MAP.concat), klabel(_MapIntToInt_),
           symbol, assoc, comm, unit(.MapIntToInt), element(_Int2Int|->_),
           index(0), format(%1%n%2)
         ]
  syntax MapIntToInt ::= ".MapIntToInt"
         [ function, total, hook(MAP.unit),
           klabel(.MapIntToInt), symbol, latex(\dotCt{MapIntToInt})
         ]
  syntax MapIntToInt ::= WrappedInt "Int2Int|->" WrappedInt
         [ function, total, hook(MAP.element),
           klabel(_Int2Int|->_), symbol,
           latex({#1}\mapsto{#2}), injective
         ]

  syntax priorities _Int2Int|->_ > _MapIntToInt_ .MapIntToInt
  syntax non-assoc _Int2Int|->_
  syntax WrappedInt ::= MapIntToInt "[" WrappedInt "]"
                 [function, hook(MAP.lookup), klabel(MapIntToInt:lookup), symbol]
  syntax WrappedInt ::= MapIntToInt "[" WrappedInt "]" "orDefault" WrappedInt
                 [ function, total, hook(MAP.lookupOrDefault),
                   klabel(MapIntToInt:lookupOrDefault), symbol
                 ]
  syntax MapIntToInt ::= MapIntToInt "[" key: WrappedInt "<-" value: WrappedInt "]"
                 [ function, total, klabel(MapIntToInt:update), symbol,
                   hook(MAP.update), prefer
                 ]
  syntax MapIntToInt ::= MapIntToInt "[" WrappedInt "<-" "undef" "]"
                 [ function, total, hook(MAP.remove),
                   klabel(_MapIntToInt[_<-undef]), symbol
                 ]
  syntax MapIntToInt ::= MapIntToInt "-Map" MapIntToInt
                 [ function, total, hook(MAP.difference),
                   latex({#1}-_{\it MapIntToIntMap}{#2})
                 ]
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
                 [function, total, hook(MAP.size), klabel(MapIntToInt.sizeMap), symbol]
  syntax Bool ::= MapIntToInt "<=Map" MapIntToInt
                 [function, total, hook(MAP.inclusion)]
  syntax WrappedInt ::= choice(MapIntToInt)
                 [function, hook(MAP.choice), klabel(MapIntToInt:choice), symbol]
endmodule

module MAP-INT-TO-INT-PRIMITIVE
  imports MAP-INT-TO-INT-PRIMITIVE-CONCRETE
  imports MAP-INT-TO-INT-PRIMITIVE-SYMBOLIC
endmodule

module MAP-INT-TO-INT-PRIMITIVE-CONCRETE [concrete]
  imports public  BOOL
  imports private K-EQUAL
  imports public  MAP-INT-TO-INT

  syntax Int ::= MapIntToInt "{{" Int "}}"
                 [function, klabel(MapIntToInt:primitiveLookup), symbol]
  syntax Int ::= MapIntToInt "{{" Int "}}" "orDefault" Int
                 [ function, total, klabel(MapIntToInt:primitiveLookupOrDefault), symbol ]
  syntax MapIntToInt ::= MapIntToInt "{{" key: Int "<-" value: Int "}}"
                 [ function, total, klabel(MapIntToInt:primitiveUpdate), symbol,
                   prefer
                 ]
  syntax MapIntToInt ::= MapIntToInt "{{" Int "<-" "undef" "}}"
                 [ function, total, klabel(MapIntToInt:primitiveRemove), symbol ]
  syntax Bool ::= Int "in_keys" "{{" MapIntToInt "}}"
                 [function, total, klabel(MapIntToInt:primitiveInKeys), symbol]

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

module MAP-INT-TO-INT-PRIMITIVE-SYMBOLIC  [symbolic]
  imports public  BOOL
  imports private K-EQUAL
  imports public  MAP-INT-TO-INT
  imports private MAP-INT-TO-INT-KORE-SYMBOLIC

  syntax Int ::= MapIntToInt "{{" Int "}}"
                 [function, symbol, klabel(MapIntToInt:primitiveLookup)]
  syntax Int ::= MapIntToInt "{{" Int "}}" "orDefault" Int
                 [ function, total, symbol, klabel(MapIntToInt:primitiveLookupOrDefault) ]
  syntax MapIntToInt ::= MapIntToInt "{{" key: Int "<-" value: Int "}}"
                 [ function, total, klabel(MapIntToInt:primitiveUpdate), symbol,
                   prefer
                 ]
  syntax MapIntToInt ::= MapIntToInt "{{" Int "<-" "undef" "}}"
                 [ function, total, symbol, klabel(MapIntToInt:primitiveRemove) ]
  syntax Bool ::= Int "in_keys" "{{" MapIntToInt "}}"
                 [function, total, symbol, klabel(MapIntToInt:primitiveInKeys)]

  // Definitions
  // -----------

  rule (wrap(Key) Int2Int|-> V:WrappedInt M:MapIntToInt)
          {{ Key:Int }}
      => unwrap( V )
      ensures notBool Key in_keys {{ M }}

  rule (wrap(Key) Int2Int|-> V:WrappedInt M:MapIntToInt)
          {{ Key:Int }} orDefault _:Int
      => unwrap( V )
      ensures notBool Key in_keys {{ M }}
  rule M:MapIntToInt {{ Key:Int }} orDefault V:Int
      => V
      requires notBool Key in_keys {{ M }}

  rule (wrap(Key) Int2Int|-> _:WrappedInt M:MapIntToInt)
          {{ Key:Int <- Value:Int }}
      => (wrap(Key) Int2Int|-> wrap(Value)) M
  rule M:MapIntToInt {{ Key:Int <- Value:Int }}
      => (wrap(Key) Int2Int|-> wrap(Value)) M
      requires notBool Key in_keys {{ M }}

  rule (wrap(Key) Int2Int|-> _:WrappedInt M:MapIntToInt)
          {{ Key:Int <- undef }}
      => M
      ensures notBool Key in_keys {{ M }}
  rule M:MapIntToInt {{ Key:Int <- undef }}
      => M
      requires notBool Key in_keys {{ M }}

  rule Key:Int in_keys
          {{wrap(Key) Int2Int|-> _:WrappedInt M:MapIntToInt}}
      => true
      ensures notBool Key in_keys {{ M }}
  rule _Key:Int in_keys {{ .MapIntToInt }}
      => false
  // TODO: This may create an exponential evaluation tree, depending on how
  // caching works in the backend. It should be rewritten to finish in
  // O(n^2) or something like that, where n is the number of explicit keys
  // in the map.
  rule Key:Int in_keys
          {{Key2:WrappedInt Int2Int|-> _:WrappedInt M:MapIntToInt}}
      => Key in_keys {{ M }}
      requires Key =/=K unwrap( Key2 )
      ensures notBool Key2 in_keys (M)
      [simplification]

  // Translation rules
  rule M:MapIntToInt[Key:WrappedInt]
      => wrap(M{{unwrap( Key )}})
      [simplification, symbolic(M)]
  rule M:MapIntToInt[Key:WrappedInt]
      => wrap(M{{unwrap( Key )}})
      [simplification, symbolic(Key)]
  rule M:MapIntToInt{{Key}}
      => unwrap( M[wrap(Key)] )
      [simplification, concrete]

  rule M:MapIntToInt [ Key:WrappedInt ] orDefault Value:WrappedInt
      => wrap(M {{ unwrap( Key ) }} orDefault unwrap( Value ))
      [simplification, symbolic(M)]
  rule M:MapIntToInt [ Key:WrappedInt ] orDefault Value:WrappedInt
      => wrap(M {{ unwrap( Key ) }} orDefault unwrap( Value ))
      [simplification, symbolic(Key)]
  rule M:MapIntToInt [ Key:WrappedInt ] orDefault Value:WrappedInt
      => wrap(M {{ unwrap( Key ) }} orDefault unwrap( Value ))
      [simplification, symbolic(Value)]
  rule M:MapIntToInt{{Key}} orDefault Value
      => unwrap( M[wrap(Key)] orDefault wrap(Value) )
      [simplification, concrete]

  rule M:MapIntToInt[Key:WrappedInt <- Value:WrappedInt]
      => M {{ unwrap( Key ) <- unwrap( Value ) }}
      [simplification, symbolic(M)]
  rule M:MapIntToInt[Key:WrappedInt <- Value:WrappedInt]
      => M {{ unwrap( Key ) <- unwrap( Value ) }}
      [simplification, symbolic(Key)]
  rule M:MapIntToInt[Key:WrappedInt <- Value:WrappedInt]
      => M {{ unwrap( Key ) <- unwrap( Value ) }}
      [simplification, symbolic(Value)]
  rule M:MapIntToInt{{Key <- Value}} => M[wrap(Key) <- wrap(Value) ]
      [simplification, concrete]

  rule M:MapIntToInt[Key:WrappedInt <- undef]
      => M {{ unwrap( Key ) <- undef }}
      [simplification, symbolic(M)]
  rule M:MapIntToInt[Key:WrappedInt <- undef]
      => M {{ unwrap( Key ) <- undef }}
      [simplification, symbolic(Key)]
  rule M:MapIntToInt{{Key <- undef}} => M[wrap(Key) <- undef]
      [simplification, concrete]

  rule Key:WrappedInt in_keys (M:MapIntToInt)
      => unwrap( Key ) in_keys {{M}}
      [simplification, symbolic(M)]
  rule Key:WrappedInt in_keys (M:MapIntToInt)
      => unwrap( Key ) in_keys {{M}}
      [simplification, symbolic(Key)]
  rule Key in_keys {{M:MapIntToInt}} => wrap(Key) in_keys(M)
      [simplification, concrete]

  // Symbolic execution rules
  // ------------------------
  syntax Bool ::= definedPrimitiveLookup(MapIntToInt, Int)  [function, total]
  rule definedPrimitiveLookup(M:MapIntToInt, K:Int) => K in_keys{{M}}

  rule #Ceil(@M:MapIntToInt {{@K:Int}})
      => {definedPrimitiveLookup(@M, @K) #Equals true}
          #And #Ceil(@M) #And #Ceil(@K)
      [simplification]

  rule M:MapIntToInt {{ K <- _ }} {{ K <- V }} => M {{ K <- V }} [simplification]
  rule (K1 Int2Int|-> V1 M:MapIntToInt) {{ K2 <- V2 }}
      => (K1 Int2Int|-> V1 (M {{ K2 <- V2 }}))
      requires unwrap( K1 ) =/=K K2
      [simplification]

  rule (K1 Int2Int|-> V1 M:MapIntToInt) {{ K2 <- undef }}
      => (K1 Int2Int|-> V1 (M {{ K2 <- undef }}))
      requires unwrap( K1 ) =/=K K2
      [simplification]

  rule (K1 Int2Int|-> _V M:MapIntToInt) {{ K2 }} => M {{K2}}
      requires unwrap( K1 ) =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToInt {{ K  <-  V1 }}) {{ K }}  => V1 [simplification]
  rule ( MAP:MapIntToInt {{ K1 <- _V1 }}) {{ K2 }} => MAP {{ K2 }}
      requires K1 =/=K K2
      [simplification]

  rule (K1 Int2Int|-> _V M:MapIntToInt) {{ K2 }} orDefault D
      => M {{K2}} orDefault D
      requires unwrap( K1 ) =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToInt {{ K  <-  V1 }}) {{ K }} orDefault _ => V1 [simplification]
  rule ( MAP:MapIntToInt {{ K1 <- _V1 }}) {{ K2 }} orDefault D
      => MAP {{ K2 }} orDefault D
      requires K1 =/=K K2
      [simplification]

  rule K in_keys{{_M:MapIntToInt {{ K <- undef }} }} => false [simplification]
  rule K in_keys{{_M:MapIntToInt {{ K <- _ }} }} => true [simplification]
  rule K1 in_keys{{ M:MapIntToInt {{ K2 <- _ }} }}
      => true requires K1 ==K K2 orBool K1 in_keys{{M}}
      [simplification]
  rule K1 in_keys{{ M:MapIntToInt {{ K2 <- _ }} }}
      => K1 in_keys {{ M }}
      requires K1 =/=K K2
      [simplification]

  rule K1 in_keys {{ (K2 Int2Int|-> V) M:MapIntToInt }}
      => K1 ==K unwrap( K2 ) orBool K1 in_keys {{ M }}
    requires definedMapElementConcat(K2, V, M)
    [simplification(100)]


  rule {false #Equals @Key in_keys{{ Key' Int2Int|-> Val @M:MapIntToInt }}}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Int|-> Val @M)
          #And #Not({ @Key #Equals unwrap( Key' ) })
          #And {false #Equals @Key in_keys{{@M}}}
      [simplification]
  rule {@Key in_keys{{Key' Int2Int|-> Val @M:MapIntToInt}} #Equals false}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Int|-> Val @M)
          #And #Not({@Key #Equals unwrap( Key' ) })
          #And {@Key in_keys{{@M}} #Equals false}
      [simplification]

endmodule

module MAP-INT-TO-INT-KORE-SYMBOLIC
  imports MAP-INT-TO-INT
  imports private K-EQUAL
  imports private BOOL

  syntax Bool ::= definedMapElementConcat(WrappedInt, WrappedInt, MapIntToInt)  [function, total]
  rule definedMapElementConcat(K, _V, M:MapIntToInt) => notBool K in_keys(M)

  rule #Ceil(@M:MapIntToInt [@K:WrappedInt])
      => {(@K in_keys(@M)) #Equals true}
          #And #Ceil(@M) #And #Ceil(@K)
      [simplification]

  rule (K Int2Int|-> _ M:MapIntToInt) [ K <- V ] => (K Int2Int|-> V M) [simplification]
  rule M:MapIntToInt [ K <- V ] => (K Int2Int|-> V M) requires notBool (K in_keys(M))
      [simplification]
  rule M:MapIntToInt [ K <- _ ] [ K <- V ] => M [ K <- V ] [simplification]
  rule (K1 Int2Int|-> V1 M:MapIntToInt) [ K2 <- V2 ] => (K1 Int2Int|-> V1 (M [ K2 <- V2 ]))
      requires K1 =/=K K2
      [simplification]

  rule (K Int2Int|-> _ M:MapIntToInt) [ K <- undef ] => M
      ensures notBool (K in_keys(M))
      [simplification]
  rule M:MapIntToInt [ K <- undef ] => M
      requires notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Int|-> V1 M:MapIntToInt) [ K2 <- undef ]
      => (K1 Int2Int|-> V1 (M [ K2 <- undef ]))
      requires K1 =/=K K2
      [simplification]

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

  rule K in_keys(_M:MapIntToInt [ K <- undef ]) => false [simplification]
  rule K in_keys(_M:MapIntToInt [ K <- _ ]) => true [simplification]
  rule K1 in_keys(M:MapIntToInt [ K2 <- _ ])
      => true requires K1 ==K K2 orBool K1 in_keys(M)
      [simplification]
  rule K1 in_keys(M:MapIntToInt [ K2 <- _ ])
      => K1 in_keys(M)
      requires K1 =/=K K2
      [simplification]

  rule K in_keys((K Int2Int|-> V) M:MapIntToInt)
      => true
    requires definedMapElementConcat(K, V, M)
    [simplification(50)]
  rule K1 in_keys((K2 Int2Int|-> V) M:MapIntToInt)
      => K1 in_keys(M)
    requires true
        andBool definedMapElementConcat(K2, V, M)
        andBool K1 =/=K K2
    [simplification(50)]
  rule K1 in_keys((K2 Int2Int|-> V) M:MapIntToInt)
      => K1 ==K K2 orBool K1 in_keys(M)
    requires definedMapElementConcat(K2, V, M)
    [simplification(100)]


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

module MAP-INT-TO-INT-CURLY-BRACE
  imports private BOOL
  imports private K-EQUAL-SYNTAX
  imports MAP-INT-TO-INT

  syntax MapIntToInt ::= MapIntToInt "{" key:WrappedInt "<-" value:WrappedInt "}"
      [function, total, symbol, klabel(MapIntToInt:curly_update)]
  rule M:MapIntToInt{Key <- Value} => M (Key Int2Int|-> Value)
    requires notBool Key in_keys(M)
  rule (Key Int2Int|-> _ M:MapIntToInt){Key <- Value}
      => M (Key Int2Int|-> Value)
  rule (M:MapIntToInt{Key <- Value})(A Int2Int|-> B N:MapIntToInt)
      => (M (A Int2Int|-> B)) {Key <- Value} N
      requires notBool A ==K Key
      [simplification]

  rule M:MapIntToInt{Key1 <- Value1}[Key2 <- Value2]
      => ((M:MapIntToInt[Key2 <- Value2]{Key1 <- Value1}) #And #Not ({Key1 #Equals Key2}))
        #Or ((M:MapIntToInt[Key2 <- Value2]) #And {Key1 #Equals Key2})
      [simplification(20)]
  rule M:MapIntToInt[Key <- Value]
      => M:MapIntToInt{Key <- Value}
      [simplification(100)]
  rule M:MapIntToInt{Key1 <- _Value1}[Key2] orDefault Value2
      => M[Key2] orDefault Value2
      requires Key1 =/=K Key2
      [simplification]
  rule _M:MapIntToInt{Key <- Value1}[Key] orDefault _Value2
      => Value1
      [simplification]
  // rule M:MapIntToInt{Key1 <- Value1}[Key2] orDefault Value2
  //     => (M[Key2] orDefault Value2 #And #Not ({Key1 #Equals Key2}))
  //       #Or (Value1 #And {Key1 #Equals Key2})
  //     [simplification]
  rule M:MapIntToInt{Key1 <- Value1}[Key2]
      => (M[Key2] #And #Not ({Key1 #Equals Key2}))
        #Or (Value1 #And {Key1 #Equals Key2})
      [simplification]

  rule Key1 in_keys(_:MapIntToInt{Key1 <- _})
      => true
      [simplification(50)]
  rule Key1 in_keys(M:MapIntToInt{Key2 <- _})
      => Key1 in_keys(M)
      requires notBool Key1 ==K Key2
      [simplification(50)]
  rule K1 in_keys(M:MapIntToInt { K2 <- _ })
      => K1 ==K K2 orBool K1 in_keys(M)
    [simplification(100)]

endmodule
