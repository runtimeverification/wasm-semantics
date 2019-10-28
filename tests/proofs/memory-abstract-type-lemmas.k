require "kwasm-lemmas.k"

module MEMORY-ABSTRACT-TYPE-LEMMAS
  imports KWASM-LEMMAS

  rule #setRange(BM, EA, #getRange(BM, EA, WIDTH), WIDTH) => BM

endmodule
