#!/bin/sh

set -eu
cd "$(dirname "$0")"

arch=$(uname --machine)
implementations=$(find ./implementations -maxdepth 1 -name "*")

if [ "${arch}" = "x86_64" ]; then
    implementations=$(echo ${implementations} | sed 's/vicare//')
fi

if [ "${arch}" = "aarch64" ]; then
    implementations=$(echo ${implementations} \
        | sed 's/rhizome-pi//' \
        | sed 's/ikarus//' \
        | sed 's/loko//')
fi

for path in $implementations; do
    name=$(basename "${path}")
    latest_path=$(find "${path}/" -maxdepth 1 -name "*" -not -name "head" | sort | tail -n 1)
    latest_version=$(basename "$latest_path")

    case ${latest_version} in
    '' | *[!0-9]*)
        echo "Latest of ${name} is ${latest_version} which is not valid and won't be built"
        ;;
    *)
        echo "Latest of ${name} is ${latest_version}"
        echo "Building path ${latest_path}"
        docker build "${latest_path}" --tag="schemers/${name}:latest"
        #docker push schemers/${name}:latest
        #docker build "${latest_path}" --tag="schemers/${name}:${latest_version}"
        #docker push schemers/${name}:${latest_version}
        #if [ ! "${build_only}" = "${name}" ]; then
            #exit
        #fi
        ;;
    esac

done
