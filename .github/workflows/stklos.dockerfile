
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - stklos/**/Dockerfile

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
        name: Build and push schemers/stklos:head
        id: docker_build_stklos:head
        uses: docker/build-push-action@v2
        with:
          push: true
          context: stklos:head/
          tags: |
            stklos:head
            stklos:head-bullseye-slim
      -
        name: Build and push schemers/stklos:1
        id: docker_build_stklos:1
        uses: docker/build-push-action@v2
        with:
          push: true
          context: stklos:1/
          tags: |
            stklos:1
            stklos:1-bullseye-slim
            stklos:latest
