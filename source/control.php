#!/usr/bin/env php

<?php

include '../setting.php';
$DEPENDENCIES = getenv('DEPENDENCIES') ?: '';

# Based on `equivs-control` output
# Commented entries have reasonable defaults.

?>
# Source: <source package name; defaults to package name>
Section: metapackage
Priority: optional
# Homepage: <enter URL here; no default>
Standards-Version: 3.9.2

Package: declarative-debian
# Version: <enter version here; defaults to 1.0>
# Maintainer: Your Name <yourname@example.com>
# Pre-Depends: <comma-separated list of packages>
Depends: <?= $DEPENDENCIES . PHP_EOL ?>
# Recommends: <comma-separated list of packages>
# Suggests: <comma-separated list of packages>
# Provides: <comma-separated list of packages>
# Replaces: <comma-separated list of packages>
# Architecture: all
# Multi-Arch: <one of: foreign|same|allowed>
# Copyright: <copyright file; defaults to GPL2>
# Changelog: <changelog file; defaults to a generic changelog>
# Readme: <README.Debian file; defaults to a generic one>
# Extra-Files: <comma-separated list of additional files for the doc directory>
# Links: <pair of space-separated paths; First is path symlink points at, second is filename of link>
# Files: <pair of space-separated paths; First is file to include, second is destination>
#  <more pairs, if there's more than one file to include. Notice the starting space>
Description: Debian declarative package management.
 This is a generated package for user customization.
 Use it to have consisten place where your packages are declared.



