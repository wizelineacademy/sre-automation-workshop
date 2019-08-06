# My Blog In The Cloud

This repo contains all the source code to build and deploy a static site blog to AWS s3.

For this blog we are using Pelican a static file generator, compared to php (WordPress) or other technologies,
this kind of sites relly on automation to "compile" or generat all the resulting HTML files which we can later
deploy to a web server or serverless cloud technologies for hosting.

Some advantages of static site generators are:

- Its extremely cheam to host them (free in most cases)
- They are super fast since no CPU cicles are used to render the page when requested
- They are super portable since we have very few dependencies to host the files and we dont need a database
- All out content is version controlled by git togheter with the scripts
- We are still able to use themes, javascript and plugins
- Our content is written in Markdown and can be easily migrated from one tool to another

## Common Operations

**Updating Content**

All our blog's content lives in `site/content` and is written in markdown. Just edit the file, see pelican
reference for tags and metadata.

**Developing Localy**

Run `make run` and open `http://localhost:8000/`. You can use this to update your theme or preview the blog's content.

**Modifying The Theme**

The theme lives in `site/theme`, similar to PHP or other CMS technologies (Rails, Django), they are HTML templates.

## Automation

all the automation tasks are controlled by make, a very common tool for run tasks.

```shell
$ make
Makefile for a static blog site

Usage:
   make help                      print this message
   make run                       build the site and serve it locally
   make build                     build the site files
   make deploy                    deploy files to s3
   make provision-infra           create the required infra for deployment

```

## References

- [pelican](https://docs.getpelican.com/en/stable/)
- [Casper2Pelican Theme](git@github.com:abr4xas/Casper2Pelican.git)

**Similar Tools**

- [zola (rust)](https://github.com/getzola/zola)
- [cobalt (rust)](https://cobalt-org.github.io/)
- [hugo (golang)](https://gohugo.io/)
