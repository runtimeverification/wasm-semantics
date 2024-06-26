```k
requires "sparse-bytes/sparse-bytes-lemmas.md"

module WASM-LEMMAS
  imports private CEILS-SYNTAX
  imports private SPARSE-BYTES-LEMMAS
  imports private WASM-TEXT

  rule Bytes2Int(#getBytesRange(_:SparseBytes, _:Int, N:Int), _:Endianness, _:Signedness) <Int M:Int
        => true
      requires 2 ^Int (8 *Int N) <=Int M
      [simplification]

  rule { (< _:IValType > _:Int) #Equals undefined } => #Bottom  [simplification]
  rule { (< _:FValType > _:Float) #Equals undefined } => #Bottom  [simplification]
  rule { (< _:RefValType > _:Int) #Equals undefined } => #Bottom  [simplification]

  rule { undefined #Equals (< _:IValType > _:Int) } => #Bottom  [simplification]
  rule { undefined #Equals (< _:FValType > _:Float) } => #Bottom  [simplification]
  rule { undefined #Equals (< _:RefValType > _:Int) } => #Bottom  [simplification]

  rule undefined ==K (< _:IValType > _:Int) => false
      [simplification]
  rule undefined ==K (< _:FValType > _:Float) => false
      [simplification]
  rule undefined ==K (< _:RefValType > _:Int) => false
      [simplification]

  rule (< _:IValType > _:Int) ==K undefined => false
      [simplification]
  rule (< _:FValType > _:Float) ==K undefined => false
      [simplification]
  rule (< _:RefValType > _:Int) ==K undefined => false
      [simplification]

  rule 0 <=Int #signedTotal(T:IValType, N:Int) => 0 <=Int N andBool N <Int #pow1(T)
      requires definedSigned(T, N)
      [simplification]

  rule #signedTotal(IType:IValType, A:Int modIntTotal M:Int) => A
      requires M ==Int #pow(IType)
          andBool 0 -Int #pow1(IType) <=Int A
          andBool A <Int #pow1(IType)
      [simplification]

  // #if is parametric in the sort of the return value, and matching
  // works on exact sort matches, so we need symplification rules
  // for all possible combinations.
  rule #typeMatches(T, #if _ #then A:Val #else B:Val #fi) => true
      requires #typeMatches(T, A) andBool #typeMatches(T, B)
      [simplification]
  rule #typeMatches(T, #if _ #then A #else B #fi:IVal) => true
      requires #typeMatches(T, A) andBool #typeMatches(T, B)
      [simplification]
  rule #typeMatches(T, #if _ #then A #else B #fi:FVal) => true
      requires #typeMatches(T, A) andBool #typeMatches(T, B)
      [simplification]
  rule #typeMatches(T, #if _ #then A #else B #fi:RefVal) => true
      requires #typeMatches(T, A) andBool #typeMatches(T, B)
      [simplification]

  // #if is parametric in the sort of the return value, and matching
  // works on exact sort matches, so we need symplification rules
  // for all possible combinations.
  rule #typeMatches(T, #if _ #then A:Val #else B #fi) => false
      requires notBool #typeMatches(T, A) andBool notBool #typeMatches(T, B)
      [simplification]
  rule #typeMatches(T, #if _ #then A #else B #fi:IVal) => false
      requires notBool #typeMatches(T, A) andBool notBool #typeMatches(T, B)
      [simplification]
  rule #typeMatches(T, #if _ #then A #else B #fi:FVal) => false
      requires notBool #typeMatches(T, A) andBool notBool #typeMatches(T, B)
      [simplification]
  rule #typeMatches(T, #if _ #then A #else B #fi:RefVal) => false
      requires notBool #typeMatches(T, A) andBool notBool #typeMatches(T, B)
      [simplification]
endmodule
```