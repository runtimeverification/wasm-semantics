```k
require "core.k"
```

```k
module WASM-BINARY
    imports WASM-CORE
```

Binary Module
-------------

Currectly, we only support binary modules written in the string format `(module binary <string>*)`.
A binary module declaration will be decoded from the concatenation of the strings.

```k
    syntax ModuleDecl ::= "(" "module" OptionalId "binary" DataString ")"
                        | "(" "module" OptionalId "binary" Defns ")"
 // ----------------------------------------------------------------
    rule <k> ( module OID binary DS:DataString ) => ( module OID binary .Defns ) ... </k>
         <bmodule> _ => parseBinaryModule(#concatDS(DS)) </bmodule>
         <bstatus> "idle" => "start" </bstatus>
```

The encoding of a binary module starts with a preamble containing a 4-byte magic number (the string "∖0asm") and a version field "\01\00\00\00".

```k
    rule <k> ( module OID binary .Defns ) ... </k>
         <bmodule> [ 0 ] [ 97 ] [ 115 ] [ 109 ] [ 1 ] [ 0 ] [ 0 ] [ 0 ] BS => BS </bmodule>
         <bstatus> "start" => "ready" </bstatus>
```

Binary Sections
---------------

In a binary module, the sections should follow a specific order:

- type section
- import section
- func section
- table section
- memory section
- global section
- export section
- start section
- element section
- code section
- data section

Most sections correspond to one component of a module record, except that function definitions are split into two sections, separating their type declarations in the function section from their bodies in the code section.

In binary moduels a section could be skipped if it is empty.
Also, a arbitrary number of custom sections could be inserted between any 2 sections.

### Custom Sections

A custom section shall start with byte `\00`, followed by the `u32` length of the section. Its content consists of a name further identifying the custom section, followed by an uninterpreted sequence of bytes for custom use. The name of custom section is a vector of bytes, with is a `u32` length of the vector followed by the sequence of bytes.

The first step is to decide how many bytes belong to the current custom section.
For now we just implement the case when the section length just occupy 1 byte, which is just taking `[ I ]` from `BS`.

**TODO**: The length of section is encoded into a `LEB128` variable-length integer, so the byte length of the length part could be larger than 1.

```k
    rule <k> ( module OID binary DS:Defns )  ... </k>
         <bmodule> [ 0 ] [ I ] BS => BS </bmodule>
         <blength> 0 => I               </blength>
         <bstatus> "ready" => "custom"  </bstatus>
```

Then we take the custom section out.

**TODO**: This operation takes I elements from `<bmodule>` cell, but there might be a more efficient way.

```k
    rule <k> ( module OID binary DS:Defns )  ... </k>
         <bmodule> BU:BUnit BS => BS </bmodule>
         <blength> I => I -Int 1     </blength>
         <bbuffer> B => B (BU .BUnits) </bbuffer>
         <bstatus> "custom"          </bstatus>
      requires I >Int 0
```

Custom sections do not contribute to the WebAssembly semantics and is ignored by an implementation.

```k
endmodule
```
