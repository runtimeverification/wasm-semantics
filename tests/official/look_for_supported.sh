#!/bin/bash

# Execute from project top directory.

unparsefile="tests/official/unparseable.txt"
unsuppfile="tests/official/unsupported.txt"

for shortname in $(cat $unparsefile $unsuppfile); do
    file=tests/wasm-tests/test/core/$shortname

    echo Trying $shortname
    echo =================

    make $file.parse
    if [ $? -eq 0 ]
    then
       make $file.run-term
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

done

# Sort the files supported, remove duplicates (shouldn't be any).
sort -u $unsuppfile -o $unsuppfile
sort -u $unparsefile -o $unparsefile
