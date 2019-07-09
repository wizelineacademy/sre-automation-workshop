#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = "wizeline"
SITENAME = "Cloud Ops Site"
SITEURL = ""
TIMEZONE = "America/Mexico_City"
DEFAULT_LANG = "en"

PATH = "content"
LOAD_CONTENT_CACHE = False

THEME = "./theme"

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (
    ("wizeline.com", "https://www.wizeline.com/"),
    ("Python.org", "http://python.org/"),
)

DEFAULT_PAGINATION = 10
SUMMARY_MAX_LENGTH = 25

AUTHOR_PIC_URL = "/theme/images/default-user.png"
DEFAULT_HEADER_IMAGE = "/theme/images/main-header.jpg"
