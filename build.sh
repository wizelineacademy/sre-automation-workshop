#!/bin/bash

pip install -r requirements.txt
( cd site && make clean && make html )

docker build -t cloudopssite .