#!/usr/bin/env bash

set -x
set -u
set -e
shopt -s nullglob

for FILE in images/*/build.json; do
    ./packer validate -syntax-only "$FILE"
done
