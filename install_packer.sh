#!/usr/bin/env bash

set -x
set -u
set -e

curl https://releases.hashicorp.com/packer/1.2.0/packer_1.2.2_linux_amd64.zip > packer.zip
unzip packer.zip

