
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - s7/**/Dockerfile

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
        name: Build and push schemers/s7:head
        id: docker_build_s7:head
        uses: docker/build-push-action@v2
        with:
          push: true
          context: s7:head/
          tags: |
            s7:head
            s7:head-bullseye-slim
            s7:latest
