#!/bin/sh

set -eu

# Without arguments builds all, with implementation name as argument builds just that one

build_only="${1:-}"
cd "$(dirname "$0")"

implementations=$(find ./implementations -maxdepth 1 -name "*")

for path in $implementations; do
    name=$(basename "${path}")
    if [ -d "${path}/head" ]; then
        if [ "${build_only}" = "" ] || [ "${build_only}" = "${name}" ]; then
            docker build "${path}/head" --tag="schemers/${name}:head"
        fi
    fi
done
