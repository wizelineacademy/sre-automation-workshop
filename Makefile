S3_BUCKET      ?= wizeline-academy-automation
AWS_PROFILE    ?= interviews-provision

.PHONY: run build deploy

.DEFAULT: run

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
