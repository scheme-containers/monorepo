#!/bin/sh

set -eu

DOCKER_BUILD="docker build --memory 8G --memory-swap 64G --cpu-period=100000 --cpu-quota=400000"

# Without arguments builds all, with implementation name as argument builds just that one

build_only="${1:-}"
cd "$(dirname "$0")"

implementations=$(find ./implementations -maxdepth 1 -name "*")

for path in $implementations; do
    name=$(basename "${path}")
    latest_path=$(find "${path}/" -maxdepth 1 -name "*" -not -name "head" | sort | tail -n 1)
    latest_version=$(basename "$latest_path")

    case ${latest_version} in
    '' | *[!0-9]*)
        if [ "${build_only}" = "" ] || [ "${build_only}" = "${name}" ]; then
            echo "Latest of ${name} is ${latest_version} which is not valid and won't be built"
        fi
        ;;
    *)
        if [ "${build_only}" = "" ] || [ "${build_only}" = "${name}" ]; then
            echo "Latest of ${name} is ${latest_version}"
            echo "Building path ${latest_path}"
            ${DOCKER_BUILD} "${latest_path}" --tag="schemers/${name}:latest"
            ${DOCKER_BUILD} "${latest_path}" --tag="schemers/${name}:${latest_version}"
            if [ ! "${build_only}" = "${name}" ]; then
                exit
            fi
        fi
        ;;
    esac

done
