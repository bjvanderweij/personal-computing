#!/bin/bash

set -e

rm -rf build/
mkdir build/

cp -r dotfiles build/
# Find all files and skip vim swap files
for f in `find dotfiles/ | grep -e '.*\.sw[op]$'`; do
    echo "dropping build/$f"
    rm build/$f
done
