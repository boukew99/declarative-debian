# Declarative Debian

Using `apt install` to install packages as you need them works fine, but it is hard to track what you have installed. Then if you want to move your packages or remove them, it becomes difficult to know which packages to select. This can result in wasted disk space.

Other distributions such as NixOS, manage their packages more **declaratively**. We can get more **declarativeness** with Debian as well by creating a [meta package](https://wiki.debian.org/metapackage). This allows tight control over the installed packages, thus having less dangling unused packages.

## Get Dependencies

We are using `[equivs](https://manpages.debian.org/testing/equivs/)` in this setup, which is a tool for creating *dummy* packages. Install it with `sudo apt install equivs`.

## Declare Dependencies

We will create a custom meta package and install it with the script `install.sh`. But this script requires the depency list. This is given through an exported variable. For this we will need to create a `setting.php` file. You can base this of the provided example:

```sh
cp setting.example.php setting.php

```

To control the packages you want, you need to state the package names by adding it to the `$dependencies` array. You can search for package names at the [Debian Package Listing](https://packages.debian.org/stable/). This listing can be used to find the **exact** package names.

## Install Dependencies

Run `./install.sh` to create the meta-package and (re-)install it. You will need to give super user access and confirm the installation.

## Updating Dependencies

It is expected that dependencies change. Just edit the `setting.php` file with the new dependencies. Then simply run `./install.sh` again.

## Removing Dependencies

The meta-package is tracked by `apt` and thus it is trivial to remove the package and its dependencies. Use:

```sh
sudo apt autoremove declarative-debian
```

All declared packages should now be removed.
