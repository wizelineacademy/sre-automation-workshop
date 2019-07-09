# Build My Blog

I have a blog based on a static page generator, my content lives on an S3 bucket and there is an index that
contains all the links of my posts. We need to create the build script that will generate a packaged docker image
with an embedded nginx server. This image can later be deployed in Kubernetes or ECS.

Steps:

1. Ensure we have python
2. install requirements.txt - [pip, python]
3. download content index from the given URL - a file with a list of links - [scripting]
4. download content listed in the index - download each link to the content folder - [curl, wget, for, parsing]
5. build the static site - `make build`
6. serve the contents using nginx - using Docker - [FROM, COPY, WORKDIR, CMD, docker]
7. depending on the environment send a header: `X-env-name: development` - [entrypoint.sh, sed]

## References

- [pelican](https://docs.getpelican.com/en/stable/)
- [Casper2Pelican Theme](git@github.com:abr4xas/Casper2Pelican.git)
