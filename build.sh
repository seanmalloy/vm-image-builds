#!/usr/bin/env bash

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

IMAGE_TIME_STAMP=$(date +%Y%m%d%H%M%S)
GIT_BRANCH=$(git symbolic-ref --short HEAD)
GIT_SHA1=$(git rev-parse HEAD | cut -c -8)

export IMAGE_TIME_STAMP
export GIT_BRANCH
export GIT_SHA1

if [ "$GIT_BRANCH" = "master" ]; then
    export IMAGE_STATE="staging"
else
    export IMAGE_STATE="dev"
fi

rm -f packer packer.zip manifest.json
curl https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip > packer.zip
unzip packer.zip
    
IMAGE_NAME=$1
./packer build images/"${IMAGE_NAME}"/build.json

rm -f packer packer.zip
