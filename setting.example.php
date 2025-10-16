<?php

$dependencies = [
    'git',
    'vlc',
    'cmatrix'
];
# Comma-separated list of dependencies.
putenv("DEPENDENCIES=" . implode(',', $dependencies));
