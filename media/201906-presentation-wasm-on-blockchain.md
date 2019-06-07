---
title: 'Semantics of WebAssembly in the K framework'
subtitle: 'What is KWasm?'
author:
-   Rikard Hjort
-   Everett Hildenbrandt
-   Qianyang Peng
date: June 8, 2019
institute:
-   Runtime Verification, Inc.
theme: metropolis
fontsize: 8pt
header-includes:
-   \usepackage{color}
-   \usepackage{fancyvrb}
-   \fvset{commandchars=\\\{\}}
-   \newcommand{\instr}{instr}
-   \newcommand{\STORE}{\textit{S}}
-   \newcommand{\FRAME}{\textit{F}}
-   \newcommand{\CONST}{\texttt{const~}}
-   \newcommand{\DATA}{\texttt{data}}
-   \newcommand{\FUNCS}{\texttt{funcs}}
-   \newcommand{\GLOBALS}{\texttt{globals}}
-   \newcommand{\GROW}{\texttt{grow}}
-   \newcommand{\ITHREETWO}{\texttt{i32}}
-   \newcommand{\LOCALS}{\texttt{locals}}
-   \newcommand{\MEMADDRS}{\texttt{memaddrs}}
-   \newcommand{\MEMORY}{\texttt{memory}}
-   \newcommand{\MEMS}{\texttt{mems}}
-   \newcommand{\MODULE}{\texttt{module}}
-   \newcommand{\SIZE}{\texttt{size}}
-   \newcommand{\TABLES}{\texttt{tables}}
-   \newcommand{\with}{\textit{~with~}}
-   \newcommand{\stepto}{~\hookrightarrow~}
-   \newcommand{\wif}[1]{\text{if}~#1}
-   \newcommand{\diminish}[1]{\begin{footnotesize}#1\end{footnotesize}}
---


Overview
--------

1. KWasm: Intro and roadmap
2. Introduction to K & KEVM
3. Deepdive: What the semantics look like
4. Demo: Proving things


KWasm: Intro and roadmap
========================

KWasm
-----

> * KWasm is the project name for specifying Wasm in K.
> * K is a framework for creating **runnable specifications** programming languages.
> * K uses rewrite based semantics, just like those Wasm is defined with [@rossberg-web-up-to-speed].
> * The goal is to use the runnable spec to **formally verify** aspects of blockchain runtimes and smart contracts.
> * There is already a specification of the EVM, called KEVM [@hildenbrandt-saxena-zhu-rosu-k-evm], which we use for formal verification. \newline ![](media/img/kevm-paper.png)

Status
------

![](media/img/github-top-screenshot.png)

. . .

* Bulk of the semantics are done.
* Tables and indirect calls in progress.
* Big todos:
  - Defining and instantiating several modules.
  - More permissive parser.
  - Add floating point numbers (not top priority).

Design
------

* A very faithful translation of Wasm spec (K and Wasm both use rewrite semantics). Some differences:
  - Two stacks: one for operands, one for instructions and control flow.
  - We are *more permissive*; allow running instructions directly:
\newline `(i32.add (i32.const 1337) (i32.const 42))` is a full program.
* Execution focused, we assume validation is done beforehand.


Goals
-----

- "Make KEVM for Ethereum 2.0".
- Create eWasm semantics, KeWasm, by importing and embedding KWasm.
- We would like to build a repository of verified code using KeWasm.
There is such a repository for KEVM: <https://github.com/runtimeverification/verified-smart-contracts>.

![](media/img/github-verified-contracts-screenshot.png)

Introduction to K
=================

The Vision: Language Independence
---------------------------------

![K Tooling Overview](media/img/k-overview.png)


K Tooling/Languages
-------------------

### Tools

-   Parser
-   Interpreter
-   Debugger
-   Reachability Logic Prover [@stefanescu-park-yuwen-li-rosu-reachability-prover]
-   ...

. . .

### Languages

-   Java 1.4 - 2015 [@bogdanas-rosu-k-java]
-   C11 - 2015 [@hathhorn-ellison-rosu-k-c]
-   KJS - 2015 [@park-stefanescu-rosu-k-js]
-   KEVM - 2018 [@hildenbrandt-saxena-zhu-rosu-k-evm]
-   KLLVM <https://github.com/kframework/llvm-semantics>
-   KX86-64 <https://github.com/kframework/X86-64-semantics>
- In progress:
   - Solidity <https://github.com/kframework/solidity-semantics>
   - Rust

Parts of a K specification
--------------------------

A language spec in K consists of 3 things

* Syntax
* Configuration ("state")
* Operational semantics as **rewrite rules**

. . .

Demo: Building a small Wasm subset.

K Specifications: Syntax
------------------------

Concrete syntax built using EBNF style:

```k
    syntax IType  ::= "i32" | "i64"
    syntax Instr  ::= "(" IType "." "const" Int ")"
    syntax Instr  ::= "(" IValType "." IBinOp ")"    // Concrete syntax
                    | IValType "." IBinOp Int Int    // Abstract syntax
    syntax Instr  ::= "(" "local.get" ")" | "(" "local.set" ")"
    syntax IBinOp ::= "div_u"
    syntax Instrs ::= List{Instr, ""} // Builtin helper for cons lists.
```

Note: we generally don't differentiate between abstract and concrete syntax.

. . .

This would allow correctly parsing programs like:

```scheme
    (local.get 1)
    (local.get 0)
    (i32.div_u)
    (local.set 0)
```

K Specifications: Configuration
-------------------------------

Tell K about the structure of your execution state.

```k
    configuration <k>        $PGM:Instrs </k>
                  <valstack> .ValStack   </valstack>
                  <locals>   .Map        </locals>
```

. . .

> - `<k>` will contain the initial parsed program.
> - `<valstack>` operand stack of `Val` items.
> - `<locals>` a mapping `Int -> Val`

```k
    syntax Val ::= "<" IValType ">" Int
```

K Specifications: Transition Rules
----------------------------------

Using the above grammar and configuration:

. . .

### Push to ValStack

\begin{Verbatim}[]
    rule <k> ( ITYPE . const I ) \textcolor{blue}{=>} #chop(< ITYPE > I) \textcolor{blue}{...} </k>
\end{Verbatim}

. . .

> - `=>` is the rewrite arrow.
> - Words in all caps are variables.
> - `...` matches the rest of the cell. In `<k>` we match the front of the cell, in `<valstack>` we match the whole cell.
> - We don't need to mention the cells we don't use or modify.

\vfill{}

. . .

\begin{Verbatim}[]
    rule <k> \textcolor{blue}{V:Val => \textbf{.}} ... </k>
         <valstack> VALSTACK => V : VALSTACK </valstack>
\end{Verbatim}

. . .

> - `.` is like $\epsilon$, so rewriting to `.` is erasing.
> - We can rewrite several cells at once.

K Specifications: Transition Rules
----------------------------------

Helper functions:

\begin{Verbatim}[]
    syntax IVal ::= #chop ( IVal ) \textcolor{blue}{[function]}
 // -----------------------------------------
    rule #chop(< ITYPE > N) => < ITYPE > (N modInt #pow(ITYPE))
    rule <k>        V:Val    => .        ... </k>
         <valstack> VALSTACK => V : VALSTACK </valstack>

   syntax Int ::= #pow  ( IValType ) \textcolor{blue}{[function]}
 // -------------------------------------------
    rule #pow (i32) => 4294967296
\end{Verbatim}

. . .

> - The `[function]` annotation means the rule applies regardless of context.

K Specifications: Transition Rules
----------------------------------

### Binary operators

\begin{Verbatim}[]
    rule <k> ( ITYPE . BOP:IBinOp ) => ITYPE . BOP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>

    rule <k> ITYPE . div_u I1 I2 => 
         \textcolor{blue}{#if} I2 =/=Int 0
           \textcolor{blue}{#then} < ITYPE > (I1 /Int I2)
           \textcolor{blue}{#else} undefined
           \textcolor{blue}{#fi} ... </k>
\end{Verbatim}

- `#if ... #then ... #else ... #fi` is built-in.

K Specifications: Transition Rules
----------------------------------

More complex examples: locals

. . .

### Get local variable

```k
    rule <k> ( local.get INDEX ) => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <locals> ... INDEX |-> VALUE ... </locals>
```

. . .

- `<locals>` is a `Map` (builtin data structure), which is an associative-commutative pair of values. We can put `...` on both sides indictating we are matching *somewhere* in the `Map`.

. . .

### Set local variable

\begin{Verbatim}[]
    rule <k> ( local.set INDEX ) => . ... </k>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <locals> ... INDEX |-> \textcolor{blue}{(_ => VALUE)} ... </locals>
\end{Verbatim}

. . .

- `_` is a wildcard (matches any value).
- We can use parentheses to isolate the part of a term we are rewriting, like updating the value part of a map entry.


## Example execution

We can run `kwasm klab-run` on our example program.


<!--- To the terminal! -->

<!---
Example Execution
-----------------

### Program

```scheme
    (local.get 1)
    (local.get 0)
    (i32.add)
    (i32.const 3)
    (i32.div_u)
    (local.set 0)
```

### Initial Configuration

```k
    <k> (local.get 1) ~>
        (local.get 0) (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```


Example Execution (cont.)
-------------------------

### Initial Configuration

```k
    <k> (local.get 1)      ~>
        (local.get 0) (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> .ValStack                       </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```

. . .

### Rule

```k
    rule <k> (local.get N) => . ... </k>
         <valstack> STACK => V : STACK  </valstack>
         <locals> ... N |-> V ... </locals>
```

Example Execution (cont.)
-------------------------

### Next Configuration

```k
    <k> (local.get 1) => . ~>
        (local.get 0) (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> .ValStack => <i32> 5 : .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```


### Rule

```k
    rule <k> (local.get N) => . ... </k>
         <valstack> STACK => V : STACK  </valstack>
         <locals> ... N |-> V ... </locals>
```

Example Execution (cont.)
-------------------------

### Next Configuration

```k
    <k> 
        (local.get 0) (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack>         <i32> 5 : .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```


### Rule

```k
    rule <k> (local.get N) => . ... </k>
         <valstack> STACK => V : STACK  </valstack>
         <locals> ... N |-> V ... </locals>
```

Example Execution (cont.)
-------------------------

Same for next instruction.

### Configuration

```k
    <k> (local.get 0)      ~>
        (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> <i32> 5 : .ValStack                      </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```

Example Execution (cont.)
-------------------------

Same for next instruction.

### Configuration

```k
    <k> (local.get 0) => . ~>
        (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> <i32> 5 : .ValStack => <i32> 2 : <i32> 5 : .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```

Example Execution (cont.)
-------------------------

### Next Configuration

```k
    <k>
        (i32.add) (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack>                        <i32> 2 : <i32> 5 : .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```

Example Execution (cont.)
-------------------------

### Configuration

```k
    <k> (i32.add) => i32.const #binop(add, <i32> 2, <i32> 5)     ~>
        (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> <i32> 2 : <i32> 5 : .ValStack              </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```

. . .

### Rule

```k
    rule <k> (ITYPE . B:BinOp) => <ITYPE> #binop(B, I1, I2) ... </k> 
         <valstack> <ITYPE, I1> : <ITYPE, I2> : STACK => STACK </valstack>
```

Example Execution (cont.)
-------------------------

### Configuration

```k
    <k> (i32.add) => i32.const #binop(add, 5, 2) ~>
        (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> <i32> 2 : <i32> 5 : .ValStack => .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> 5 </locals>
```

### Rule

```k
    rule <k> (ITYPE . B:BinOp) => ITYPE . const #binop(B, I1, I2) ... </k> 
         <valstack> <ITYPE, I2> : <ITYPE, I1> : STACK => STACK </valstack>
```

Example Execution (cont.)
-------------------------

### Configuration

```k
    <k>              i32.const #binop(add, 5, 2) ~>
        (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> <i32> 2 : <i32> 5 : .ValStack => .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> <i32> 5 </locals>
```

### Rule

```k
    rule <k> (ITYPE . B:BinOp) => (ITYPE . const #binop(B, I1, I2)) ... </k> 
         <valstack> <ITYPE, I2> : <ITYPE, I1> : STACK => STACK </valstack>
```

Example Execution (cont.)
-------------------------

### Configuration

```k
    <k> (i32.const #binop(add, 5, 2)) ~>
        (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> <i32> 5 </locals>
```

. . .

### Rule

```k
    rule #binop(add, I1, I2) => I1 +Int I2
```

Example Execution (cont.)
-------------------------

### Configuration

```k
    <k> (i32.const (5 +Int 2) ~>
        (i32.const 3) (i32.div_u) (local.set 0)
    </k>
    <valstack> .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> <i32> 5 </locals>
```

### Rule

```k
    rule #binop(add, I1, I2) => I1 +Int I2
```

Example Execution (cont.)
-------------------------

Fast forward a bit ...

### Configuration

```k
    <k> (local.set 0) </k>
    <valstack> <i32> 2 : .ValStack </valstack>
    <locals> 0 |-> <i32> 2    1 |-> <i32> <i32> 5 </locals>
```

### Rule

```k
    rule #binop(add, I1, I2) => I1 +Int I2
```




# TODO

---->


KWasm repo
==============

Wasm Specification
------------------

Available at <https://github.com/WebAssembly/spec>.

-   Fairly unambiguous[^betterThanEVM].
-   Well written with procedural description of execution accompanied by small-step semantic rules.

[^betterThanEVM]: Better than the [YellowPaper](https://github.com/ethereum/yellowpaper).

Wasm Specification
------------------

Semantic rule:

$$
\STORE; \FRAME; \MEMORY.\SIZE \stepto \STORE; \FRAME; (\ITHREETWO.\CONST sz)
$$
$$
(\wif{|\STORE.\MEMS[\FRAME.\MODULE.\MEMADDRS[0]].\DATA| = sz * 64 Ki)}
$$

. . .

*store* ($\STORE$) and a *current frame* ($\FRAME$):

\begin{alignat*}{5}
%&store      &::=~&\{ & \quad &\FUNCS    ~&\quad &funcinst^*         &     \\
&store      &::=~&\{ & \quad &\dots     ~&\quad &                   &     \\
%&           &    &   & \quad &\TABLES   ~&\quad &tableinst^*        &     \\
&           &    &   & \quad &\MEMS     ~&\quad &meminst^*          &     \\
&           &    &   & \quad &\dots     ~&\quad &                   &\}   \\
%&           &    &   & \quad &\GLOBALS  ~&\quad &globalinst^* \quad &\}   \\
&frame      &::=~&\{ & \quad &\LOCALS   ~&\quad &val^*              &     \\
&           &    &   & \quad &\MODULE   ~&\quad &moduleinst   \quad &\}   \\
&moduleinst~&::=~&\{~& \quad &\dots     ~&\quad &                   &     \\
&           &    &   & \quad &\MEMADDRS ~&\quad &memaddr^*          &     \\
&           &    &   & \quad &\dots     ~&\quad &                   &\}
\end{alignat*}

Wasm Specification (cont.)
--------------------------

**Example rule:** `(memory.size)`

. . .

Execution description:

1. Let $\FRAME$ be the current frame.
2. \diminish{Assert: due to validation, $\FRAME.\MODULE.\MEMADDRS[0]$ exists.}
3. Let $a$ be the memory address $\FRAME.\MODULE.\MEMADDRS[0]$.[^memIdxZero]
4. \diminish{Assert: due to validation, $\STORE.\MEMS[a]$ exists.}
5. Let $mem$ be the memory instance $\STORE.\MEMS[a]$.
6. Let $sz$ be the length of $mem.\DATA$ divided by the page size.
7. Push the value $\ITHREETWO.\CONST sz$ to the stack.

[^memIdxZero]: Every module in Wasm has a single memory for now, so we always implicitly work on `memaddrs[0]`.


Demo: implement a Wasm subset
=============================

`(memory.size)`
---------------

$$
\STORE ; \FRAME ; \MEMORY.\SIZE \stepto \STORE ; \FRAME ; (\ITHREETWO.\CONST sz)
$$
$$
\wif {
|\STORE.\MEMS[\FRAME.\MODULE.\MEMADDRS[0]].\DATA| = sz \cdot 64 Ki
}
$$

\vfill{}

\begin{alignat*}{5}
%&store      &::=~&\{ & \quad &\FUNCS    ~&\quad &funcinst^*         &     \\
&store      &::=~&\{ & \quad &\dots     ~&\quad &                   &     \\
%&           &    &   & \quad &\TABLES   ~&\quad &tableinst^*        &     \\
&           &    &   & \quad &\MEMS     ~&\quad &meminst^*          &     \\
&           &    &   & \quad &\dots     ~&\quad &                   &\}   \\
%&           &    &   & \quad &\GLOBALS  ~&\quad &globalinst^* \quad &\}   \\
&frame      &::=~&\{ & \quad &\LOCALS   ~&\quad &val^*              &     \\
&           &    &   & \quad &\MODULE   ~&\quad &moduleinst   \quad &\}   \\
&moduleinst~&::=~&\{~& \quad &\dots     ~&\quad &                   &     \\
&           &    &   & \quad &\MEMADDRS ~&\quad &memaddr^*          &     \\
&           &    &   & \quad &\dots     ~&\quad &                   &\}
\end{alignat*}

`(memory.grow)`
---------------

\begin{align*}
\STORE; \FRAME ; &(\ITHREETWO.\CONST n)~(\MEMORY.\GROW) \stepto \STORE ' ; \FRAME ; (\ITHREETWO.\CONST sz ) \\
(&\wif{\FRAME.\MODULE.\MEMADDRS[0] = a \\
&\land sz = |\STORE.\MEMS[a].\DATA|/64 Ki \\
&\land \STORE ' = \STORE \with \MEMS[a] = growmem(\STORE.\MEMS[a], n))} \\
\\
\STORE; \FRAME ; &(\ITHREETWO.\CONST n)~(\MEMORY.\GROW) \stepto \STORE ; \FRAME ; (\ITHREETWO.\CONST {-1} ) \\
\end{align*}

Proving
=======

Verifying Ethereum contracts
----------------------------

1. Contracts are compiled to Ethereum virtual machine (EVM) bytecode.
2. Some property or invariant is specified as a rewrite rule.
3. K tries to construct a proof (using the SMT solver Z3) that every possible execution path eventually rewrites to the correct thing
4. The tool KLab (by DappHub) offers an interactive view of execution paths, great for seeing where and why the prover failed.



Conclusion/Questions?
=====================

References
----------

-   Thanks for listening!

\tiny



<!--
SCRATCH
=======

* Explain semantics of imp, that Id's always refer to unique identifiers.
* Replace `loop` example with own example (smth you wrote)





KWasm Design
============

Design Choice: Incremental Semantics
------------------------------------

-   KWasm semantics are given incrementally.
-   Makes it possible to execute program fragments.
-   Allows users to quickly experiment with Wasm using KWasm.

\vfill{}

. . .

For example, KWasm will happily execute the following fragment (without an enclosing `module`):

```wast
    (i32.const 4)
    (i32.const 5)
    (i32.add)
```

Using KWasm (Psuedo-Demo)
=========================

Getting/Building
----------------

Clone the repository:

```sh
git clone 'https://github.com/kframework/wasm-semantics'
cd wasm-semantics
```

Build the dependencies, then the KWasm semantics:

```sh
make deps
make build
```

`kwasm` Script
--------------

The file `./kwasm` is the main runner for KWasm.

### Running `./kwasm help`

```sh
usage: ./kwasm (run|test) [--backend (ocaml|java|haskell)] <pgm>  <K args>*
       ./kwasm prove      [--backend (java|haskell)]       <spec> <K args>*
       ./kwasm klab-(run|prove)                            <spec> <K args>*

    ./kwasm run   : Run a single WebAssembly program
    ./kwasm test  : Run a single WebAssembly program like it's a test
    ./kwasm prove : Run a WebAssembly K proof

    Note: <pgm> is a path to a file containing a WebAssembly program.
          <spec> is a K specification to be proved.
          <K args> are any arguments you want to pass to K when executing/proving.
```

Running a Program
-----------------

### Wasm Program `pgm1.wast`

```wasm
(i32.const 4)
(i32.const 5)
(i32.add)
```

### Result of `./kwasm run pgm1.wast`

```k
<generatedTop>
  <k>
    .
  </k>
  <stack>
    < i32 > 9 : .Stack
  </stack>
</generatedTop>
```

Conclusion/Questions?
=====================


-->
