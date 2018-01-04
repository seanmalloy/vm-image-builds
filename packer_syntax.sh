#!/usr/bin/env bash

set -u
set -e

for FILE in $(ls images/*/build.json 2> /dev/null); do
    ./packer validate -syntax-only
done
