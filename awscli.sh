#!/bin/bash

# This scripts help us to invoke the awscli using a docker image like `$ ./awscli.sh s3 ls`
# we are mounting the aws credentials found in ~/.aws and using the specified profile.

docker run --rm -ti \
    -v "$(pwd)/site:/site" \
    -v ~/.aws/:/root/.aws \
    -e AWS_PROFILE \
    wizeacademy/blog-deployer:latest \
    "$@"
