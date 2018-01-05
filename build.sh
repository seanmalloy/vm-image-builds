#!/usr/bin/env bash

set -u
set -e

# GCP_CRED_FILE
#
# Path to the GCP JSON file. It must
# be exported in the environment.

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
    
IMAGE_NAME=$1
packer build images/"${IMAGE_NAME}"/build.json
