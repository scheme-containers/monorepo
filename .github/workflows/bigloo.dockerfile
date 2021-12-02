
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - bigloo/**/Dockerfile

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
        name: Build and push schemers/bigloo:head
        id: docker_build_bigloo:head
        uses: docker/build-push-action@v2
        with:
          push: true
          context: bigloo:head/
          tags: |
            bigloo:head
            bigloo:head-bullseye-slim
      -
        name: Build and push schemers/bigloo:4
        id: docker_build_bigloo:4
        uses: docker/build-push-action@v2
        with:
          push: true
          context: bigloo:4/
          tags: |
            bigloo:4
            bigloo:0-bullseye-slim
            bigloo:latest
