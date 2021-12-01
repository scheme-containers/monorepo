#!/bin/sh
set -eu
cd "$(dirname "$0")"
set -x
chibi-scheme docker-gen.scm <stklos.scm >stklos.dockerfile
