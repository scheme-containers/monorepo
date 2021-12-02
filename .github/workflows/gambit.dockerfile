
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - gambit/**/Dockerfile

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
        name: Build and push schemers/gambit:head
        id: docker_build_gambit:head
        uses: docker/build-push-action@v2
        with:
          push: true
          context: gambit:head/
          tags: |
            gambit:head
            gambit:head-bullseye-slim
      -
        name: Build and push schemers/gambit:4
        id: docker_build_gambit:4
        uses: docker/build-push-action@v2
        with:
          push: true
          context: gambit:4/
          tags: |
            gambit:4
            gambit:4.9
            gambit:4-bullseye-slim
            gambit:latest
