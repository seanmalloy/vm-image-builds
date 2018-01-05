#!/usr/bin/env bash

set -u
set -e
shopt -s nullglob

for FILE in images/*/build.json; do
    echo "Check packer syntax for file ... $FILE"
    ./packer validate -syntax-only "$FILE"
done
