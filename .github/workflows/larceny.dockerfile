
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - larceny/**/Dockerfile

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
        name: Build and push schemers/larceny:1.3
        id: docker_build_larceny:1.3
        uses: docker/build-push-action@v2
        with:
          push: true
          context: larceny:1.3/
          tags: |
            larceny:1.3
            larceny:1
            larceny:1-bullseye-slim
            larceny:latest
