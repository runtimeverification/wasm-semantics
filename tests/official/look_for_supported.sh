#!/bin/bash

# Execute from project top directory.

for file in `find tests/official/unsupported/*.wast`; do
    shortname=$(echo $file | sed -E -s "s/.*\/([^/]+.wast)/\1/")
    echo Trying $shortname
    echo =================
    make $file.run-term
    if [ $? -eq 0 ]
    then
        file_supp=$(echo $file | sed -s "s/unsupported/supported/")
        git mv $file $file_supp
        git commit -m "TEST: $shortname"
        notify-send "Success: $shortname"
    else
        notify-send "Failed: $shortname"
    fi
done
