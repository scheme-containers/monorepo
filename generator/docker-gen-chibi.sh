#!/bin/sh
set -eu
d="$(dirname "$0")"
d="$(cd "$d"/../../../lispunion/lispconf && pwd)"
exec chibi-scheme -A "$PWD" -A "$d" docker-gen.scm "$@"
