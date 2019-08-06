#!/bin/bash

docker run --rm -ti \
    -v "$(pwd)/site:/site" \
    -v ~/.aws/:/root/.aws \
    -e AWS_PROFILE \
    wizeacademy/blog-deployer:latest \
    "$@"
