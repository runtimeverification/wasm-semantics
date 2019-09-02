#!/bin/bash

# Execute from project top directory.

unparsefile="tests/conformance/unparseable.txt"

for backend in ocaml llvm; do
    unsuppfile="tests/conformance/unsupported-$backend.txt"
    for shortname in $(cat $unparsefile $unsuppfile); do
        file=tests/wasm-tests/test/core/$shortname

        echo Trying $shortname
        echo =================

        make $file.parse
        if [ $? -eq 0 ]
        then
            make $file.run-term TEST_CONCRETE_BACKEND=$backend
            if [ $? -eq 0 ]
            then
                # Now supported, remove.
                sed --in-place "/$shortname/d" $unparsefile
                sed --in-place "/$shortname/d" $unsuppfile
                echo "Success: $shortname\n"
            else
                echo $shortname >> $unsuppfile
                sed --in-place "/$shortname/d" $unparsefile
                echo "Unsupported: $shortname\n"
            fi
        else
            echo $shortname >> $unparsefile
            sed --in-place "/$shortname/d" $unsuppfile
            echo "Unparseable: $shortname\n"
        fi

        # Sort the files supported, remove duplicates.
        sort -u $unsuppfile -o $unsuppfile
        sort -u $unparsefile -o $unparsefile
    done
done

