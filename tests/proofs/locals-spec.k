requires "kwasm-lemmas.md"

module LOCALS-SPEC
    imports KWASM-LEMMAS

    claim <instrs> #local.get(X) ~> #local.set(X) => .K ... </instrs>
          <locals>
            X |-> _:IVal
          </locals>

    claim <instrs> #local.get(X) ~> #local.set(X) => .K ... </instrs>
          <locals>
            X |-> _:FVal
          </locals>

    claim <instrs> #local.get(X) ~> #local.set(X) => .K ... </instrs>
          <locals>
            X |-> _:RefVal
          </locals>

endmodule
