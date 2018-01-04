#!/usr/bin/env bash

set -u
set -e

for FILE in images/*/build.json; do
    ./packer validate -syntax-only $FILE
done
