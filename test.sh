#!/usr/bin/env bash

set -x
set -u
set -e

# Magical Jenkins Environment Variables
#
# ???

# Install test-kitchen
scl enable rh-ruby24 "bundle install --path vendor/bundle"

# TODO: set GCE preempt setting in env
# TODO: generate SSH key pair
# TODO: parse manifest.json

IMAGE_NAME=$1
pushd images/"${IMAGE_NAME}"

# TODO: bundle exec kitchen --no-color --destroy=always

popd
# TODO: delete SSH key pair
