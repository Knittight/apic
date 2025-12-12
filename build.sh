#!/bin/bash

set -e

PKG_NAME="apic"          # Package name
VERSION="1.0"            # Version
BUILD_DIR="$(pwd)/build" # Temporary build directory
OUTPUT="${PKG_NAME}_${VERSION}_all.deb"

echo "== Building ${PKG_NAME}.deb from usr/local/bin =="

# Clean previous build
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/usr/local/bin"
mkdir -p "$BUILD_DIR/DEBIAN"

# Copy DEBIAN/control
if [ ! -f DEBIAN/control ]; then
    echo "ERROR: DEBIAN/control file not found!"
    exit 1
fi
cp DEBIAN/control "$BUILD_DIR/DEBIAN/"

# Copy Python script
if [ ! -f usr/local/bin/$PKG_NAME ]; then
    echo "ERROR: usr/local/bin/$PKG_NAME not found!"
    exit 1
fi
cp usr/local/bin/$PKG_NAME "$BUILD_DIR/usr/local/bin/"
chmod +x "$BUILD_DIR/usr/local/bin/$PKG_NAME"

# Build the .deb
dpkg-deb --build "$BUILD_DIR" "$OUTPUT"

echo ""
echo "Build complete!"
echo "Created: $OUTPUT"
