#!/usr/bin/env bash

source ../setting.sh # holds exported variables

# Name should not clash with existing package names.
PACKAGE=${PACKAGE:-"declarative-debian"}

# Placing files in /tmp, go there for debugging
# Name includes the unique process ID, making it safe for multiple executions.
PACKAGE_DIR="/tmp/${PACKAGE}-$$"
mkdir -p "$PACKAGE_DIR/DEBIAN"

# Using a fixed base and a dynamic timestamp guarantees a higher version number for updates.
export VERSION="1.0-$(date +%Y%m%d%H%M%S)" 

# Templating the control file using the exported variables
bash control.sh > "$PACKAGE_DIR/DEBIAN/control" 

# Building the debian package
dpkg-deb --build "$PACKAGE_DIR" /tmp/declarative-$$.deb

# (Re)installing
sudo apt install --reinstall /tmp/declarative-$$.deb