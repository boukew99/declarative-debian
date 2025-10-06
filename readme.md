# Declarative Debian

Using `apt install` to install packages as you need them works fine, but it is hard to track what you have installed. Then if you want to move your packages or remove them, it becomes difficult to know which packages to select. This can result in wasted disk space.

Other distributions such as NixOS, manage their packages more **declaratively**. We can get more **declarativeness** with Debian as well by creating a [meta package](https://wiki.debian.org/metapackage). This allows tight control over the installed packages, thus having less dangling unused packages. 

## Declare Dependencies

We will create a custom meta package and install it with the script `install.sh`. But this script requires some variables, specifically the dependencies. This will be done through exported Bash variables. For this we will need to create a `setting.sh` file above the project root. Note this is file is **outside** the project root, since it is considered a user specific configuration file. The following is an example content of the `setting.sh` file:

```bash
# Maintainer information.
export MAINTAINER="boukew99 <email@example.com>"

# Comma-separated list of dependencies.
export DEPENDENCIES="git, vlc, cmatrix"
```

To control the packages you want, you need to state the package names as a **comma-separated list** in a `DEPENDENCIES` variable and export it. You can search for package names at the [Debian Package Listing](https://packages.debian.org/stable/). This listing can be used to find the **exact** package names to use in the `DEPENDENCIES` variable.

You can also fill the `MAINTAINER` variable to be *correct*, otherwise it will default to `anonymous`.

There are more variables you can override in `control.sh`

## Install Dependencies

Run `./install.sh` to create the meta-package and (re-)install it. You will need to give super user access and confirm the installation.

# Updating Dependencies

It is expected that dependencies change. Just edit the `setting.sh` file with the new dependencies. Then simply run `./install.sh` again. 

## Removing Dependencies

The meta-package is tracked by `apt` and thus it is trivial to remove the packages. Use:

```sh
sudo apt remove declarative-debian
```

This uses the package name. All declared packages should now be removed.

## Sharing Packages

The `install.sh` scripts creates a `.deb` package in `/tmp` by default since for local use it is not used after installation. However you can share this package with others. This can be an alternative to giving the instruction to get the packages with `apt install`. Instead you can share the `.deb` pacakge and instruct to do `apt install yourapp.deb`. After being done with the app the user can then just do `apt remove yourapp.deb` to clean their system again.

You will have to fill in more of the variables in `control.sh` though. You can find them in `control.sh`.
