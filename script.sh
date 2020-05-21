#!/bin/bash
set -eu

if [ -n "$(git diff-index --name-only HEAD --)" ]; then
    echo "Uncommitted changes, commit or stash them"
    exit 1
fi

current_hash=$(git rev-list -n 1 HEAD)
short=${current_hash[@]:0:4}
echo $short

make deps


make build -j2
git tag -f builds_$short

make test -j7
git tag -f tests_$short

make test-conformance -j7
git tag -f conforms_$short
