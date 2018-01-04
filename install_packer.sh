#!/usr/bin/env bash

set -x
set -u
set -e

curl https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip > packer.zip
unzip packer.zip

