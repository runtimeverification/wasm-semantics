```k
require "map-int-to-bytes.k"

module ELROND-CONFIGURATION
    imports BYTES
    imports INT
    imports MAP-INTW-TO-BYTESW

    configuration
        <elrond>
            <buffers>.MapIntwToBytesw</buffers>
            <caller>.Bytes</caller>
        </elrond>
endmodule
```