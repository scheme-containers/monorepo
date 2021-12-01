#!/bin/sh
set -eu
d="$(dirname "$0")"
d="$(cd "$d"/../../../lispunion/lispconf && pwd)"
exec gosh -r 7 -A "$PWD" -A "$d" docker-gen.scm "$@"
