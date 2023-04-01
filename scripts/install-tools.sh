#!/bin/bash -eu

cd tools
while read -r i; do
    echo "## go install ${i}"
    go install "${i}"
done < <(go list -f '{{ join .Imports "\n" }}' -tags tools .)
