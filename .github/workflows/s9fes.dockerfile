
name: docker-actions

on:
  push:
    branches:
      - 'master'
    paths:
      - s9fes/**/Dockerfile

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
        name: Build and push schemers/s9fes:2018
        id: docker_build_s9fes:2018
        uses: docker/build-push-action@v2
        with:
          push: true
          context: s9fes:2018/
          tags: |
            s9fes:2018
            s9fes:2018-bullseye-slim
            s9fes:latest
