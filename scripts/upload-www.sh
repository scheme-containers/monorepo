#!/bin/sh
set -eu
cd "$(dirname "$0")"
cd ..
curl --location --fail --silent --show-error -o www/schemeorg.css \
    https://www.scheme.org/schemeorg.css
rsync -vcr www/ tuonela.scheme.org:/production/containers/www/
