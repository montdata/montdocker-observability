---
layout: default
title: Building this repo
nav_order: 100
---
# Building this repo

Preview your changes using the [Jekyll Docker](https://github.com/envygeeks/jekyll-docker/blob/master/README.md) image:

```bash
docker run --rm --volume="$PWD:/srv/jekyll" \
    -it -p 4000:4000 jekyll/jekyll:3.8 \
    jekyll serve --watch
```