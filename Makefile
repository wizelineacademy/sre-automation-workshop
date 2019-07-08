.PHONY: build run

.DEFAULT: run

run: build
	docker run --rm -ti -p 8000:80 cloudopssite:latest

build:
	./build.sh