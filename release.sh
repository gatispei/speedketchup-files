#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

[ "$(uname -s)" = Darwin ] || {
	echo "release.sh has to run on macos" >&2
	exit 1
}

make -C ../speedketchup release

cp ../speedketchup/bin/speedketchup-* bin/

./update-readme
ls -l bin/
