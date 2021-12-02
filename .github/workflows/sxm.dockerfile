
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - sxm/**/Dockerfile

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
        name: Build and push schemers/sxm:1.1
        id: docker_build_sxm:1.1
        uses: docker/build-push-action@v2
        with:
          push: true
          context: sxm:1.1/
          tags: |
            sxm:1.1
            sxm:1
            sxm:1-bullseye-slim
            sxm:latest
