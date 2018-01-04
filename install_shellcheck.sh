#!/usr/bin/env bash

set -u
set -e

curl https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz > shellcheck.xz
tar xf shellcheck.xz
./shellcheck-latest/shellcheck --version
