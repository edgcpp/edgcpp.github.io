#!/usr/bin/env bash
#
# Build the edgcpp/compiler documentation at a tag or branch and copy it into
# this site, so Jekyll publishes it with everything else.
#
# Usage: build-compiler-docs.sh <ref> <dest>
#
# <dest> is relative to the site root and is also the URL path the docs are
# served under; for example, "doc" is published at https://edgcpp.org/doc/.

set -euo pipefail

ref="$1"
dest="$2"
clone="$(mktemp -d)"

# Fetch only doc/; a full checkout of the compiler tree is over 3 GB.
git -c advice.detachedHead=false clone --quiet --depth 1 --branch "$ref" \
  --filter=blob:none --sparse https://github.com/edgcpp/compiler.git "$clone"
git -C "$clone" sparse-checkout set doc
echo "Building compiler documentation at $ref" \
  "($(git -C "$clone" rev-parse --short HEAD)) into $dest/"

docker run --rm \
  -v "$clone:/work" \
  -w /work/doc \
  edgcpp/sphinx-env:latest \
  make dirhtml SPHINXOPTS="-D html_baseurl=https://edgcpp.org/$dest/"

mkdir -p "$dest"
cp -a "$clone/doc/build/dirhtml/." "$dest/"
