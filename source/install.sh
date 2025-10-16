
#!/usr/bin/env bash

mkdir -p /tmp/declarative-debian

# Templating the control file
php control.php > "/tmp/declarative-debian/declarative-debian"

(
    # Change working directory for the build process
    cd /tmp/declarative-debian


    # Building the debian package
    equivs-build declarative-debian

    # (Re)installing
    sudo apt install --reinstall ./declarative-debian_1.0_all.deb

)

# https://manpages.debian.org/testing/equivs/equivs-build.1.en.html
