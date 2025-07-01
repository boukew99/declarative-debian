# Custom Debian Meta Packages
Using `apt install` to install packages as you need them works fine, but it is hard to track what you have installed. Then if you want to move your packages or remove them again, it becomes difficult to know which packages to select.

Other distributions such as NixOS, manage their packages more Declaratively. We can get more Declarativeness with Debian as well by creatinig a [meta package](https://wiki.debian.org/metapackage)! And it is easy!

## Customize
The [control file](package/DEBIAN/control) contains the information for building the meta package.

> This meta-package has been prefilled with my username `boukew99`, but you should change this to your own name everywhere.

The most important line is `Depends: ...`. Here you declare which packages you want included. So if you add `tldr` here, then it will be installed when installing the meta package, for example.

You can search for package names at <https://www.debian.org/distrib/packages>.

## Build
To build the package use:
```sh
dpkg-deb --build package boukew99.deb
```
Now you should have a `.deb` file. This `.deb` file you can transport to any system where you need it.

## Install
With the `.deb` we can install the meta package using `apt`. Do:
```sh
sudo apt install ./boukew99.deb
```
Now the packages should be available for use! Check by using one such package, `tldr` in the terminal!

## Remove
The meta-package is tracked by `apt` and thus it is trivial to remove the packages. Use:
```sh
sudo apt remove boukew99
```
This uses the package name. All packages should be removed now.

> If updating the package is required, use the `--reinstall` instead of removing and installing again

### Lore
One of the popular meta-packages tools is `taskel`. User can for example use this to install a graphical enviroment from a new Debian system.

<https://wiki.debian.org/tasksel>

### Adding files to the package
Although it stops being a meta-package if we add files, we can still do that! A meta-package is an easy introduction to Debian packaging. And we can make a bigger package if we start adding files.

You can add a custom command, available in $PATH, by adding a Python script to `/usr/local/bin/`. Just make this folder path in the `package/` and add the script. This can then look like `package/usr/local/bin/myscript`. Don't forget to set its executable flag: `chmod +x package/usr/local/bin/myscript`. After installing you should be able to call the script from the terminal with `myscript`.

Another thing which might be useful is to add is a portable binary, such as [`magick` from its own repository](https://imagemagick.org/script/download.php). Then you will have a newer version, which Debian might not provide in order to remain stable. However, then the package becomes architecture depended though!
