#!/bin/sh

implementations=$(find ./implementations -maxdepth 1 -name "*")

for path in $implementations
do
    name=$(basename ${path})
    if [ -d ${path}/head ]
    then
        echo ${path}
        docker build ${path}/head --tag=schemers/${name}:head
    fi
done
