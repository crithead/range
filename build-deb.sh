#!/bin/bash
# PoC to build and man page and Debian package.
# TODO
# * Add man page generation to CMakeLists.txt
# * Add Debian package generation to CMakeLists.txt

readonly PKGNAME="range"
readonly VERSION="${1:-0.1.0}"
echo "Building online manual page for $PKGNAME $VERSION"
rm -f "${PKGNAME}.1"
pandoc --standalone --to man range.md -o "${PKGNAME}.1"

echo "Building debian package for $PKGNAME $VERSION"
pushd build > /dev/null
rm -f *.deb
fpm -s dir -t deb -v "$VERSION" -n "$PKGNAME" \
    --license="CC0" \
    --url="https://github.com/crithead/range" \
    --prefix "/usr/local/bin" range
popd > /dev/null
mv -f "build/${PKGNAME}_${VERSION}_amd64.deb" .
