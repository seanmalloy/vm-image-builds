#!/usr/bin/env bash

set -x
set -u
set -e

# GCP Credentials
#
# 1. GCE Instance With Service Account
#
# Run this script from a GCE instace with a
# service account that has the required GCP
# permissions to run packer. This is the
# preferred option.
#
# 2. Environment Variable
#
# Set the environment variable GOOGLE_APPLICATION_CREDENTIALS
# to the path to a GCP service account credentials file and
# export the variable.

# Magical Jenkins Environment Variables
#
# BRANCH_NAME    - git branch name
# PACKER_VERSION - packer version

CHECKPOINT_DISABLE=1
IMAGE_TIME_STAMP=$(date +%Y%m%d%H%M%S)
GIT_SHA1=$(git rev-parse HEAD | cut -c -8)
PACKER_NO_COLOR=1

export IMAGE_TIME_STAMP
export GIT_SHA1
export CHECKPOINT_DISABLE
export PACKER_NO_COLOR

if [ "$BRANCH_NAME" = "master" ]; then
    export IMAGE_STATE="staging"
else
    export IMAGE_STATE="dev"
fi

rm -f packer packer.zip manifest.json
curl https://releases.hashicorp.com/packer/"${PACKER_VERSION}"/packer_"${PACKER_VERSION}"_linux_amd64.zip > packer.zip
unzip packer.zip
    
IMAGE_NAME=$1
./packer build images/"${IMAGE_NAME}"/build.json

rm -f packer packer.zip
