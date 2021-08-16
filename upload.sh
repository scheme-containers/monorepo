#!/bin/sh
set -eu
cd "$(dirname "$0")"
curl --location --fail --silent --show-error -o www/schemeorg.css \
    https://www.staging.scheme.org/schemeorg.css
rsync -vr www/ alpha.servers.scheme.org:/production/containers/www/
