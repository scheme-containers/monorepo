#!/bin/sh

set -eu

DOCKER_BUILD="docker build --memory 8G --memory-swap 8G --cpu-period=100000 --cpu-quota=400000"

# Without arguments builds all, with implementation name as argument builds just that one

build_only="${1:-}"
cd "$(dirname "$0")"

implementations=$(find ./implementations -maxdepth 1 -name "*")

for path in $implementations; do
    name=$(basename "${path}")
    if [ -d "${path}/head" ]; then
        if [ "${build_only}" = "" ] || [ "${build_only}" = "${name}" ]; then
            ${DOCKER_BUILD} "${path}/head" --tag="schemers/${name}:head"
        fi
    fi
done
