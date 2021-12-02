
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - chezscheme/**/Dockerfile

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      -
        name: Checkout
        uses: actions/checkout@v2
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1
      -
        name: Login to DockerHub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Build and push schemers/chezscheme:9-threads
        id: docker_build_chezscheme:9-threads
        uses: docker/build-push-action@v2
        with:
          push: true
          context: chezscheme:9-threads/
          tags: |
            chezscheme:9-threads
            chezscheme:9.5-threads
            chezscheme:threads
      -
        name: Build and push schemers/chezscheme:9-alpine
        id: docker_build_chezscheme:9-alpine
        uses: docker/build-push-action@v2
        with:
          push: true
          context: chezscheme:9-alpine/
          tags: |
            chezscheme:9-alpine
            chezscheme:alpine
      -
        name: Build and push schemers/chezscheme:9
        id: docker_build_chezscheme:9
        uses: docker/build-push-action@v2
        with:
          push: true
          context: chezscheme:9/
          tags: |
            chezscheme:9
            chezscheme:9.5
            chezscheme:9-bullseye-slim
            chezscheme:latest
