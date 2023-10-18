module MUTABLE-BYTES-SYNTAX
  import BYTES
  import INT

  syntax MutableBytes

  syntax MutableBytes ::= ".MutableBytes" [function, total]

  syntax Bytes ::= substrBytes(MutableBytes, startIndex: Int, endIndex: Int) [function]
  syntax MutableBytes ::= replaceAtBytes(dest: MutableBytes, index: Int, src: Bytes) [function]
  syntax MutableBytes ::= padRightBytes(MutableBytes, length: Int) [function]
  syntax Int ::= lengthBytes(MutableBytes) [function, total]

  // syntax Bytes ::= Bytes "+Bytes" Bytes [function, total, hook(BYTES.concat), right]

endmodule

module MUTABLE-BYTES
  import BOOL
  import MUTABLE-BYTES-SYNTAX

  // Leaf size: 16, 4 bits
  // Node list size: 4, 2 bits

  syntax MutableBytesPrivate  ::= Leaf(Bytes)  // Is start needed?
                                | "Zero"
                                | Node(childSize:Int, MutableBytesPrivateList)

  syntax MutableBytesPrivateList ::= List{MutableBytesPrivate, "::"}

  syntax MutableBytes ::= mutableBytes(size:Int, bytes: MutableBytesPrivate)

  rule .MutableBytes => mutableBytes(0, Zero)

  // --------------------------------------------------
  //                   substrBytes
  // --------------------------------------------------

  rule substrBytes(mutableBytes(Size:Int, M:MutableBytesPrivate), Start:Int, End:Int)
      => #substrBytes(M, Start, End)
      requires 0 <=Int Start andBool Start <=Int End andBool End <=Int Size

  syntax Bytes ::= #substrBytes(MutableBytesPrivate, startIndex: Int, endIndex: Int) [function]

  rule #substrBytes(Leaf(B:Bytes), Start:Int, End:Int)
      => substrBytes(B, Start, End)

  rule #substrBytes(Zero, Start:Int, End:Int)
      => padRightBytes(b"", End -Int Start, 0)

  // TODO: Perhaps process multiple child entries at the same time?
  rule #substrBytes(Node(ChildSize, _ :: Cs), Start, End)
      => #substrBytes(Node(ChildSize, Cs), Start -Int ChildSize, End -Int ChildSize)
      requires ChildSize <=Int Start

  rule #substrBytes(Node(ChildSize, C :: Cs), Start, End)
      => #substrBytes(C, Start, ChildSize) +Bytes #substrBytes(Node(ChildSize, Cs), 0, End -Int ChildSize)
      requires Start <Int ChildSize andBool ChildSize <Int End

  rule #substrBytes(Node(ChildSize, C :: _Cs), Start, End)
      => #substrBytes(C, Start, End)
      requires End <=Int ChildSize

  // --------------------------------------------------
  //                  replaceAtBytes
  // --------------------------------------------------

  syntax MutableBytesPrivate ::= #replaceAtBytes(size:Int, dest: MutableBytesPrivate, index: Int, src: Bytes) [function]
  syntax MutableBytesPrivateList ::= #replaceAtBytesList(childSize:Int, dest: MutableBytesPrivateList, index: Int, src: Bytes) [function]
  syntax MutableBytesPrivate ::= expandZeroNode(size:Int)  [function]

  rule replaceAtBytes(mutableBytes(Size:Int, Dest:MutableBytesPrivate), Index:Int, Src:Bytes)
      => mutableBytes(Size, #replaceAtBytes(Size, Dest, Index, Src))
    requires 0 <=Int Index andBool Index +Int lengthBytes(Src) <=Int Size

  rule #replaceAtBytes(_Size:Int, Leaf(B:Bytes), Index:Int, Src:Bytes)
      => Leaf(replaceAtBytes(B, Index, Src))

  // TODO: Should I check whether the bytes are 0 after the update and also replace
  // things like Leaf(zeros) with Zero?
  rule #replaceAtBytes(Size:Int, Zero, Index:Int, Src:Bytes)
      => #replaceAtBytes(Size, expandZeroNode(Size), Index:Int, Src:Bytes)

  rule #replaceAtBytes(_Size:Int, Node(ChildSize, Cs), Index:Int, Src:Bytes)
      => Node(ChildSize, #replaceAtBytesList(ChildSize, Cs, Index, Src))

  rule #replaceAtBytesList(ChildSize:Int, C :: Cs:MutableBytesPrivateList, Index:Int, Src:Bytes)
      => C :: #replaceAtBytesList(ChildSize, Cs, Index -Int ChildSize, Src)
    requires ChildSize <=Int Index

  rule #replaceAtBytesList(ChildSize:Int, C :: Cs:MutableBytesPrivateList, Index:Int, Src:Bytes)
        => #replaceAtBytes(ChildSize, C, Index, substrBytes(Src, 0, ChildSize -Int Index))
          :: #replaceAtBytesList(
                  ChildSize, Cs, 0,
                  substrBytes(Src, ChildSize -Int Index, lengthBytes(Src) -Int (ChildSize -Int Index))
            )
    requires Index <Int ChildSize andBool ChildSize <Int Index +Int lengthBytes(Src)

  rule #replaceAtBytesList(ChildSize:Int, C :: Cs:MutableBytesPrivateList, Index:Int, Src:Bytes)
        => #replaceAtBytes(ChildSize, C, Index, Src)
          :: Cs
    requires Index +Int lengthBytes(Src) <=Int ChildSize

  rule expandZeroNode(16) => Leaf(padRightBytes(b"", 16, 0))
  rule expandZeroNode(Size:Int) => Node(Size >>Int 2, Zero :: Zero :: Zero :: Zero)
      requires 16 <Int Size andBool Size &Int 15 ==Int 0

  // --------------------------------------------------
  //                  padRightBytes
  // --------------------------------------------------

  syntax MutableBytesPrivate ::= #increaseDepth(MutableBytesPrivate, childSize:Int, length:Int) [function]

  rule padRightBytes(mutableBytes(Size, _) #as M:MutableBytes, Length:Int)
      => M
    requires Length <=Int Size
  rule padRightBytes(mutableBytes(0, _), Length:Int)
      => padRightBytes(mutableBytes(1, Zero), Length:Int)
    requires 0 <Int Length
  rule padRightBytes(mutableBytes(Size, M:MutableBytesPrivate), Length:Int)
      => mutableBytes(Length, #increaseDepth(M, ((Size +Int 16 -Int 1) >>Int 4) <<Int 4, Length))
    requires 0 <Int Size andBool Size <Int Length

  rule #increaseDepth(M:MutableBytesPrivate, ChildSize:Int, Length:Int)
      => M
  requires Length <=Int ChildSize
  rule #increaseDepth(M:MutableBytesPrivate, ChildSize:Int, Length:Int)
      => #increaseDepth(Node(ChildSize, M :: Zero :: Zero :: Zero), ChildSize *Int 4, Length)
    requires ChildSize <Int Length

  // --------------------------------------------------
  //                  lengthBytes
  // --------------------------------------------------

  rule lengthBytes(mutableBytes(Size:Int, _)) => Size
endmodule
