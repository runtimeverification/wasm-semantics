requires "kwasm-lemmas.md"

module LOCALS-SPEC
    imports WASM

    claim <instrs> #local.get(X) ~> #local.set(X) => .K ... </instrs>
          <locals>
            Locals:List
            ListItem(_:IVal)
            _:List
          </locals>
          requires size(Locals) ==Int X

    claim <instrs> #local.get(X) ~> #local.set(X) => .K ... </instrs>
          <locals>
            Locals:List
            ListItem(_:FVal)
            _:List
          </locals>
          requires size(Locals) ==Int X

    claim <instrs> #local.get(X) ~> #local.set(X) => .K ... </instrs>
          <locals>
            Locals:List
            ListItem(_:RefVal)
            _:List
          </locals>
          requires size(Locals) ==Int X

endmodule
