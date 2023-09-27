
require "int-type.k"
// require "val-type.k"

module MAP-INT-TO-VAL
  imports private BOOL-SYNTAX
  imports private INT-SYNTAX
  // imports private LIST-INT
  // imports private LIST-VAL
  imports private LIST
  // imports private SET-INT
  imports private SET
  imports INT-TYPE
  // imports VAL-TYPE

  syntax Int
  syntax Val

  syntax MapIntToVal [hook(MAP.Map)]
  syntax MapIntToVal ::= MapIntToVal MapIntToVal
         [ left, function, hook(MAP.concat), klabel(_MapIntToVal_),
           symbol, assoc, comm, unit(.MapIntToVal), element(_Int2Val|->_),
           index(0), format(%1%n%2)
         ]
  syntax MapIntToVal ::= ".MapIntToVal"
         [ function, total, hook(MAP.unit),
           klabel(.MapIntToVal), symbol, latex(\dotCt{MapIntToVal})
         ]
  syntax MapIntToVal ::= WrappedInt "Int2Val|->" Val
         [ function, total, hook(MAP.element),
           klabel(_Int2Val|->_), symbol,
           latex({#1}\mapsto{#2}), injective
         ]

  syntax priorities _Int2Val|->_ > _MapIntToVal_ .MapIntToVal
  syntax non-assoc _Int2Val|->_
  syntax Val ::= MapIntToVal "[" WrappedInt "]"
                 [function, hook(MAP.lookup), klabel(MapIntToVal:lookup), symbol]
  syntax Val ::= MapIntToVal "[" WrappedInt "]" "orDefault" Val
                 [ function, total, hook(MAP.lookupOrDefault),
                   klabel(MapIntToVal:lookupOrDefault), symbol
                 ]
  syntax MapIntToVal ::= MapIntToVal "[" key: WrappedInt "<-" value: Val "]"
                 [ function, total, klabel(MapIntToVal:update), symbol,
                   hook(MAP.update), prefer
                 ]
  syntax MapIntToVal ::= MapIntToVal "[" WrappedInt "<-" "undef" "]"
                 [ function, total, hook(MAP.remove),
                   klabel(_MapIntToVal[_<-undef]), symbol
                 ]
  syntax MapIntToVal ::= MapIntToVal "-Map" MapIntToVal
                 [ function, total, hook(MAP.difference),
                   latex({#1}-_{\it MapIntToValMap}{#2})
                 ]
  syntax MapIntToVal ::= updateMap(MapIntToVal, MapIntToVal)
                 [function, total, hook(MAP.updateAll)]

  syntax MapIntToVal ::= removeAll(MapIntToVal, Set)
                 [function, total, hook(MAP.removeAll)]
  // syntax MapIntToVal ::= removeAll(MapIntToVal, SetInt)
  //                [function, total, hook(MAP.removeAll)]

  syntax Set ::= keys(MapIntToVal)
                 [function, total, hook(MAP.keys)]
  // syntax SetInt ::= keys(MapIntToVal)
  //                [function, total, hook(MAP.keys)]

  syntax List ::= "keys_list" "(" MapIntToVal ")"
                 [function, hook(MAP.keys_list)]
  // syntax ListInt ::= "keys_list" "(" MapIntToVal ")"
  //                [function, hook(MAP.keys_list)]

  syntax Bool ::= WrappedInt "in_keys" "(" MapIntToVal ")"
                 [function, total, hook(MAP.in_keys)]

  syntax List ::= values(MapIntToVal)
                 [function, hook(MAP.values)]
  // syntax ListVal ::= values(MapIntToVal)
  //                [function, hook(MAP.values)]

  syntax Int ::= size(MapIntToVal)
                 [function, total, hook(MAP.size), klabel(MapIntToVal.sizeMap), symbol]
  syntax Bool ::= MapIntToVal "<=Map" MapIntToVal
                 [function, total, hook(MAP.inclusion)]
  syntax WrappedInt ::= choice(MapIntToVal)
                 [function, hook(MAP.choice), klabel(MapIntToVal:choice), symbol]
endmodule

module MAP-INT-TO-VAL-PRIMITIVE
  imports MAP-INT-TO-VAL-PRIMITIVE-CONCRETE
  imports MAP-INT-TO-VAL-PRIMITIVE-SYMBOLIC
endmodule

module MAP-INT-TO-VAL-PRIMITIVE-CONCRETE [concrete]
  imports public  BOOL
  imports private K-EQUAL
  imports public  MAP-INT-TO-VAL

  syntax Val ::= MapIntToVal "{{" Int "}}"
                 [function, klabel(MapIntToVal:primitiveLookup), symbol]
  syntax Val ::= MapIntToVal "{{" Int "}}" "orDefault" Val
                 [ function, total, klabel(MapIntToVal:primitiveLookupOrDefault), symbol ]
  syntax MapIntToVal ::= MapIntToVal "{{" key: Int "<-" value: Val "}}"
                 [ function, total, klabel(MapIntToVal:primitiveUpdate), symbol,
                   prefer
                 ]
  syntax MapIntToVal ::= MapIntToVal "{{" Int "<-" "undef" "}}"
                 [ function, total, klabel(MapIntToVal:primitiveRemove), symbol ]
  syntax Bool ::= Int "in_keys" "{{" MapIntToVal "}}"
                 [function, total, klabel(MapIntToVal:primitiveInKeys), symbol]

  rule (M:MapIntToVal {{ Key:Int }})
      => (M[wrap(Key)])
  rule M:MapIntToVal {{ Key:Int }} orDefault Value:Val
      => M[wrap(Key)] orDefault Value
  rule M:MapIntToVal {{ Key:Int <- Value:Val }}
      => M[wrap(Key) <- Value]
  rule M:MapIntToVal {{ Key:Int <- undef }}
      => M[wrap(Key) <- undef]
  rule Key:Int in_keys {{ M:MapIntToVal }} => wrap(Key) in_keys(M)
endmodule

module MAP-INT-TO-VAL-PRIMITIVE-SYMBOLIC  [symbolic]
  imports public  BOOL
  imports private K-EQUAL
  imports public  MAP-INT-TO-VAL
  imports private MAP-INT-TO-VAL-KORE-SYMBOLIC

  syntax Val ::= MapIntToVal "{{" Int "}}"
                 [function, symbol, klabel(MapIntToVal:primitiveLookup)]
  syntax Val ::= MapIntToVal "{{" Int "}}" "orDefault" Val
                 [ function, total, symbol, klabel(MapIntToVal:primitiveLookupOrDefault) ]
  syntax MapIntToVal ::= MapIntToVal "{{" key: Int "<-" value: Val "}}"
                 [ function, total, klabel(MapIntToVal:primitiveUpdate), symbol,
                   prefer
                 ]
  syntax MapIntToVal ::= MapIntToVal "{{" Int "<-" "undef" "}}"
                 [ function, total, symbol, klabel(MapIntToVal:primitiveRemove) ]
  syntax Bool ::= Int "in_keys" "{{" MapIntToVal "}}"
                 [function, total, symbol, klabel(MapIntToVal:primitiveInKeys)]

  // Definitions
  // -----------

  rule (wrap(Key) Int2Val|-> V:Val M:MapIntToVal)
          {{ Key:Int }}
      => V
      ensures notBool Key in_keys {{ M }}

  rule (wrap(Key) Int2Val|-> V:Val M:MapIntToVal)
          {{ Key:Int }} orDefault _:Val
      => V
      ensures notBool Key in_keys {{ M }}
  rule M:MapIntToVal {{ Key:Int }} orDefault V:Val
      => V
      requires notBool Key in_keys {{ M }}

  rule (wrap(Key) Int2Val|-> _:Val M:MapIntToVal)
          {{ Key:Int <- Value:Val }}
      => (wrap(Key) Int2Val|-> Value) M
  rule M:MapIntToVal {{ Key:Int <- Value:Val }}
      => (wrap(Key) Int2Val|-> Value) M
      requires notBool Key in_keys {{ M }}

  rule (wrap(Key) Int2Val|-> _:Val M:MapIntToVal)
          {{ Key:Int <- undef }}
      => M
      ensures notBool Key in_keys {{ M }}
  rule M:MapIntToVal {{ Key:Int <- undef }}
      => M
      requires notBool Key in_keys {{ M }}

  rule Key:Int in_keys
          {{wrap(Key) Int2Val|-> _:Val M:MapIntToVal}}
      => true
      ensures notBool Key in_keys {{ M }}
  rule _Key:Int in_keys {{ .MapIntToVal }}
      => false
  // TODO: This may create an exponential evaluation tree, depending on how
  // caching works in the backend. It should be rewritten to finish in
  // O(n^2) or something like that, where n is the number of explicit keys
  // in the map.
  rule Key:Int in_keys
          {{Key2:WrappedInt Int2Val|-> _:Val M:MapIntToVal}}
      => Key in_keys {{ M }}
      requires Key =/=K unwrap( Key2 )
      ensures notBool Key2 in_keys (M)
      [simplification]

  // Translation rules
  rule M:MapIntToVal[Key:WrappedInt]
      => M{{unwrap( Key )}}
      [simplification, symbolic(M)]
  rule M:MapIntToVal[Key:WrappedInt]
      => M{{unwrap( Key )}}
      [simplification, symbolic(Key)]
  rule M:MapIntToVal{{Key}}
      => M[wrap(Key)]
      [simplification, concrete]

  rule M:MapIntToVal [ Key:WrappedInt ] orDefault Value:Val
      => M {{ unwrap( Key ) }} orDefault Value
      [simplification, symbolic(M)]
  rule M:MapIntToVal [ Key:WrappedInt ] orDefault Value:Val
      => M {{ unwrap( Key ) }} orDefault Value
      [simplification, symbolic(Key)]
  rule M:MapIntToVal [ Key:WrappedInt ] orDefault Value:Val
      => M {{ unwrap( Key ) }} orDefault Value
      [simplification, symbolic(Value)]
  rule M:MapIntToVal{{Key}} orDefault Value
      => M[wrap(Key)] orDefault Value
      [simplification, concrete]

  rule M:MapIntToVal[Key:WrappedInt <- Value:Val]
      => M {{ unwrap( Key ) <- Value }}
      [simplification, symbolic(M)]
  rule M:MapIntToVal[Key:WrappedInt <- Value:Val]
      => M {{ unwrap( Key ) <- Value }}
      [simplification, symbolic(Key)]
  rule M:MapIntToVal[Key:WrappedInt <- Value:Val]
      => M {{ unwrap( Key ) <- Value }}
      [simplification, symbolic(Value)]
  rule M:MapIntToVal{{Key <- Value}} => M[wrap(Key) <- Value ]
      [simplification, concrete]

  rule M:MapIntToVal[Key:WrappedInt <- undef]
      => M {{ unwrap( Key ) <- undef }}
      [simplification, symbolic(M)]
  rule M:MapIntToVal[Key:WrappedInt <- undef]
      => M {{ unwrap( Key ) <- undef }}
      [simplification, symbolic(Key)]
  rule M:MapIntToVal{{Key <- undef}} => M[wrap(Key) <- undef]
      [simplification, concrete]

  rule Key:WrappedInt in_keys (M:MapIntToVal)
      => unwrap( Key ) in_keys {{M}}
      [simplification, symbolic(M)]
  rule Key:WrappedInt in_keys (M:MapIntToVal)
      => unwrap( Key ) in_keys {{M}}
      [simplification, symbolic(Key)]
  rule Key in_keys {{M:MapIntToVal}} => wrap(Key) in_keys(M)
      [simplification, concrete]

  // Symbolic execution rules
  // ------------------------
  syntax Bool ::= definedPrimitiveLookup(MapIntToVal, Int)  [function, total]
  rule definedPrimitiveLookup(M:MapIntToVal, K:Int) => K in_keys{{M}}

  rule #Ceil(@M:MapIntToVal {{@K:Int}})
      => {definedPrimitiveLookup(@M, @K) #Equals true}
          #And #Ceil(@M) #And #Ceil(@K)
      [simplification]

  rule M:MapIntToVal {{ K <- _ }} {{ K <- V }} => M {{ K <- V }} [simplification]
  rule (K1 Int2Val|-> V1 M:MapIntToVal) {{ K2 <- V2 }}
      => (K1 Int2Val|-> V1 (M {{ K2 <- V2 }}))
      requires unwrap( K1 ) =/=K K2
      [simplification]

  rule (K1 Int2Val|-> V1 M:MapIntToVal) {{ K2 <- undef }}
      => (K1 Int2Val|-> V1 (M {{ K2 <- undef }}))
      requires unwrap( K1 ) =/=K K2
      [simplification]

  rule (K1 Int2Val|-> _V M:MapIntToVal) {{ K2 }} => M {{K2}}
      requires unwrap( K1 ) =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToVal {{ K  <-  V1 }}) {{ K }}  => V1 [simplification]
  rule ( MAP:MapIntToVal {{ K1 <- _V1 }}) {{ K2 }} => MAP {{ K2 }}
      requires K1 =/=K K2
      [simplification]

  rule (K1 Int2Val|-> _V M:MapIntToVal) {{ K2 }} orDefault D
      => M {{K2}} orDefault D
      requires unwrap( K1 ) =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToVal {{ K  <-  V1 }}) {{ K }} orDefault _ => V1 [simplification]
  rule ( MAP:MapIntToVal {{ K1 <- _V1 }}) {{ K2 }} orDefault D
      => MAP {{ K2 }} orDefault D
      requires K1 =/=K K2
      [simplification]

  rule K in_keys{{_M:MapIntToVal {{ K <- undef }} }} => false [simplification]
  rule K in_keys{{_M:MapIntToVal {{ K <- _ }} }} => true [simplification]
  rule K1 in_keys{{ M:MapIntToVal {{ K2 <- _ }} }}
      => true requires K1 ==K K2 orBool K1 in_keys{{M}}
      [simplification]
  rule K1 in_keys{{ M:MapIntToVal {{ K2 <- _ }} }}
      => K1 in_keys {{ M }}
      requires K1 =/=K K2
      [simplification]

  rule K1 in_keys {{ (K2 Int2Val|-> V) M:MapIntToVal }}
      => K1 ==K unwrap( K2 ) orBool K1 in_keys {{ M }}
    requires definedMapElementConcat(K2, V, M)
    [simplification(100)]


  rule {false #Equals @Key in_keys{{ Key' Int2Val|-> Val @M:MapIntToVal }}}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Val|-> Val @M)
          #And #Not({ @Key #Equals unwrap( Key' ) })
          #And {false #Equals @Key in_keys{{@M}}}
      [simplification]
  rule {@Key in_keys{{Key' Int2Val|-> Val @M:MapIntToVal}} #Equals false}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Val|-> Val @M)
          #And #Not({@Key #Equals unwrap( Key' ) })
          #And {@Key in_keys{{@M}} #Equals false}
      [simplification]

endmodule

module MAP-INT-TO-VAL-KORE-SYMBOLIC
  imports MAP-INT-TO-VAL
  imports private K-EQUAL
  imports private BOOL

  syntax Bool ::= definedMapElementConcat(WrappedInt, Val, MapIntToVal)  [function, total]
  rule definedMapElementConcat(K, _V, M:MapIntToVal) => notBool K in_keys(M)

  rule #Ceil(@M:MapIntToVal [@K:WrappedInt])
      => {(@K in_keys(@M)) #Equals true}
          #And #Ceil(@M) #And #Ceil(@K)
      [simplification]

  rule (K Int2Val|-> _ M:MapIntToVal) [ K <- V ] => (K Int2Val|-> V M) [simplification]
  rule M:MapIntToVal [ K <- V ] => (K Int2Val|-> V M) requires notBool (K in_keys(M))
      [simplification]
  rule M:MapIntToVal [ K <- _ ] [ K <- V ] => M [ K <- V ] [simplification]
  rule (K1 Int2Val|-> V1 M:MapIntToVal) [ K2 <- V2 ] => (K1 Int2Val|-> V1 (M [ K2 <- V2 ]))
      requires K1 =/=K K2
      [simplification]

  rule (K Int2Val|-> _ M:MapIntToVal) [ K <- undef ] => M
      ensures notBool (K in_keys(M))
      [simplification]
  rule M:MapIntToVal [ K <- undef ] => M
      requires notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Val|-> V1 M:MapIntToVal) [ K2 <- undef ]
      => (K1 Int2Val|-> V1 (M [ K2 <- undef ]))
      requires K1 =/=K K2
      [simplification]

  rule (K  Int2Val|->  V M:MapIntToVal) [ K ] => V
      ensures notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Val|-> _V M:MapIntToVal) [ K2 ] => M [K2]
      requires K1 =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToVal [ K  <-  V1 ]) [ K ]  => V1 [simplification]
  rule ( MAP:MapIntToVal [ K1 <- _V1 ]) [ K2 ] => MAP [ K2 ]
      requires K1 =/=K K2
      [simplification]

  rule (K  Int2Val|->  V M:MapIntToVal) [  K ] orDefault _ => V
      ensures notBool (K in_keys(M))
      [simplification]
  rule (K1 Int2Val|-> _V M:MapIntToVal) [ K2 ] orDefault D
      => M [K2] orDefault D
      requires K1 =/=K K2
      ensures notBool (K1 in_keys(M))
      [simplification]
  rule (_MAP:MapIntToVal [ K  <-  V1 ]) [ K ] orDefault _ => V1 [simplification]
  rule ( MAP:MapIntToVal [ K1 <- _V1 ]) [ K2 ] orDefault D
      => MAP [ K2 ] orDefault D
      requires K1 =/=K K2
      [simplification]
  rule .MapIntToVal [ _ ] orDefault D => D [simplification]

  rule K in_keys(_M:MapIntToVal [ K <- undef ]) => false [simplification]
  rule K in_keys(_M:MapIntToVal [ K <- _ ]) => true [simplification]
  rule K1 in_keys(M:MapIntToVal [ K2 <- _ ])
      => true requires K1 ==K K2 orBool K1 in_keys(M)
      [simplification]
  rule K1 in_keys(M:MapIntToVal [ K2 <- _ ])
      => K1 in_keys(M)
      requires K1 =/=K K2
      [simplification]

  rule K in_keys((K Int2Val|-> V) M:MapIntToVal)
      => true
    requires definedMapElementConcat(K, V, M)
    [simplification(50)]
  rule K1 in_keys((K2 Int2Val|-> V) M:MapIntToVal)
      => K1 in_keys(M)
    requires true
        andBool definedMapElementConcat(K2, V, M)
        andBool K1 =/=K K2
    [simplification(50)]
  rule K1 in_keys((K2 Int2Val|-> V) M:MapIntToVal)
      => K1 ==K K2 orBool K1 in_keys(M)
    requires definedMapElementConcat(K2, V, M)
    [simplification(100)]


  rule {false #Equals @Key in_keys(.MapIntToVal)} => #Ceil(@Key) [simplification]
  rule {@Key in_keys(.MapIntToVal) #Equals false} => #Ceil(@Key) [simplification]
  rule {false #Equals @Key in_keys(Key' Int2Val|-> Val @M:MapIntToVal)}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Val|-> Val @M)
          #And #Not({@Key #Equals Key'})
          #And {false #Equals @Key in_keys(@M)}
      [simplification]
  rule {@Key in_keys(Key' Int2Val|-> Val @M:MapIntToVal) #Equals false}
      =>  #Ceil(@Key) #And #Ceil(Key' Int2Val|-> Val @M)
          #And #Not({@Key #Equals Key'})
          #And {@Key in_keys(@M) #Equals false}
      [simplification]
endmodule

module MAP-INT-TO-VAL-CURLY-BRACE
  imports private BOOL
  imports private K-EQUAL-SYNTAX
  imports MAP-INT-TO-VAL

  syntax MapIntToVal ::= MapIntToVal "{" key:WrappedInt "<-" value:Val "}"
      [function, total, symbol, klabel(MapIntToVal:curly_update)]
  rule M:MapIntToVal{Key <- Value} => M (Key Int2Val|-> Value)
    requires notBool Key in_keys(M)
  rule (Key Int2Val|-> _ M:MapIntToVal){Key <- Value}
      => M (Key Int2Val|-> Value)
  rule (M:MapIntToVal{Key <- Value})(A Int2Val|-> B N:MapIntToVal)
      => (M (A Int2Val|-> B)) {Key <- Value} N
      requires notBool A ==K Key
      [simplification]

  rule M:MapIntToVal{Key1 <- Value1}[Key2 <- Value2]
      => ((M:MapIntToVal[Key2 <- Value2]{Key1 <- Value1}) #And #Not ({Key1 #Equals Key2}))
        #Or ((M:MapIntToVal[Key2 <- Value2]) #And {Key1 #Equals Key2})
      [simplification(20)]
  rule M:MapIntToVal[Key <- Value]
      => M:MapIntToVal{Key <- Value}
      [simplification(100)]
  rule M:MapIntToVal{Key1 <- _Value1}[Key2] orDefault Value2
      => M[Key2] orDefault Value2
      requires Key1 =/=K Key2
      [simplification]
  rule _M:MapIntToVal{Key <- Value1}[Key] orDefault _Value2
      => Value1
      [simplification]
  // rule M:MapIntToVal{Key1 <- Value1}[Key2] orDefault Value2
  //     => (M[Key2] orDefault Value2 #And #Not ({Key1 #Equals Key2}))
  //       #Or (Value1 #And {Key1 #Equals Key2})
  //     [simplification]
  rule M:MapIntToVal{Key1 <- Value1}[Key2]
      => (M[Key2] #And #Not ({Key1 #Equals Key2}))
        #Or (Value1 #And {Key1 #Equals Key2})
      [simplification]

  rule Key1 in_keys(_:MapIntToVal{Key1 <- _})
      => true
      [simplification(50)]
  rule Key1 in_keys(M:MapIntToVal{Key2 <- _})
      => Key1 in_keys(M)
      requires notBool Key1 ==K Key2
      [simplification(50)]
  rule K1 in_keys(M:MapIntToVal { K2 <- _ })
      => K1 ==K K2 orBool K1 in_keys(M)
    [simplification(100)]

endmodule
