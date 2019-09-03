#!/bin/bash

# Execute the script from project top directory.

# This script considers all conformance tests currently listed as unparseable or unsupported, and tries parsing and executing them in turn.
# If both steps are successfull, the confromance test is deleted from the lists.
# If either step fails, the conformance test is added to the correct list and removed from the other.

unparsefile="tests/conformance/unparseable.txt"

unparseable=$(cat $unparsefile)

for backend in ocaml llvm; do
    unsuppfile="tests/conformance/unsupported-$backend.txt"
    unsupported=$(cat $unsuppfile)
    for shortname in $unparseable $unsupported; do
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

