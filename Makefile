# ---- UPDATE THESE VALUES ----
S3_BUCKET      ?= wizeline-academy-automation
AWS_PROFILE    ?= interviews-provision
# ---- /UPDATE THESE VALUES ----

# PHONY targets are not associated with files
.PHONY: help run build deploy provision-infra

# the default target is the first target
help:
	@echo 'Makefile for a static blog site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help                      print this message                      '
	@echo '   make run                       build the site and serve it locally     '
	@echo '   make build                     build the site files                    '
	@echo '   make deploy                    deploy files to s3                      '
	@echo '   make provision-infra           create the required infra for deployment'
	@echo '                                                                          '

run: build
	docker build -t wizeacademy/blog -f Dockerfile .
	docker run --rm -ti -p 8000:80 wizeacademy/blog:latest

build:
	docker build -t wizeacademy/blog-builder -f Dockerfile.build .
	docker run --rm -ti \
		-v $(CURDIR)/site:/site \
		wizeacademy/blog-builder:latest

deploy: build
	docker build -t wizeacademy/blog-deployer -f Dockerfile.deploy .
	AWS_PROFILE=$(AWS_PROFILE) ./awscli.sh s3 cp --recursive /site/output s3://$(S3_BUCKET)/

provision-infra:
	# TODO: use docker for running tf
	cd $(CURDIR)/infrastructure; \
	terraform init; \
	terraform apply -auto-approve -input=false
