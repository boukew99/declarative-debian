#!/usr/bin/env bash

# DEBIAN/control template

## Overrideable variables

DEPENDENCIES=${DEPENDENCIES:-""}
VERSION=${VERSION:-"1.0"}
HOMEPAGE=${HOMEPAGE:-"https://github.com/boukew99/declarative-debian"}
MAINTAINER=${MAINTAINER:-"anonymous"}
DESCRIPTION=${DESCRIPTION:-"Debian declarative package management for user customization. This is a generated package by declarative-debian."}

PACKAGE=${PACKAGE:-"declarative-debian"} 

## Static fields

ARCHITECTURE="all"
PRIORITY="optional"
SECTION="metapackages"

## Printing

cat << EOF
Package: $PACKAGE
Version: $VERSION
Section: $SECTION
Priority: $PRIORITY
Architecture: $ARCHITECTURE
Depends: $DEPENDENCIES
Homepage: $HOMEPAGE
Maintainer: $MAINTAINER
Description: $DESCRIPTION
EOF

# https://www.debian.org/doc/debian-policy/ch-controlfields.html#debian-binary-package-control-files-debian-control
# Meta-packages don't deal with source code, so most information does not apply. We just skip to the end and do it manually.


