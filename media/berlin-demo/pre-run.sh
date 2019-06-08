#!/bin/bash

cd ../..
./build
./kwasm klab-run media/berlin-demo/example-execution.wast
for i in `seq 3`; do
    FILE=div$i-spec.k
    echo ""
    echo ""
    echo "$FILE"
    ./kwasm klab-prove media/berlin-demo/$FILE -m KWASM-LEMMAS
done

cd -
