
supermicro-update-manager-deb
=============

Build scripts to easily create a amd64 `.deb` package for [Supermicro Update Manager](https://www.supermicro.com/solutions/SMS_SUM.cfm).
Tested on Devuan ceres but should work on other Debian derivatives, such as Ubuntu, as well.

The scripts are based on https://github.com/procurios/ipmiview-deb which doesn't specify an explicit license.

The created package provides:

 * A `/usr/sbin/supermicro-update-manager` wrapper around the `sum` binary supplied by the package (which would conflict with `/usr/bin/sum` from coreutils)
 * A man page written by yours truly based on the help output of the `sum` utility.
 
Dependencies
------------

You will need the `devscripts`, `libdistro-info-perl` and the `debhelper` packages installed in order to build the supermicro-update-manager `.deb` file:

```sh
apt-get install devscripts debhelper libdistro-info-perl
```


Building
--------

* Download the `.tar.gz` file from the [Supermicro website](https://www.supermicro.com/SwDownload/SwSelect_Free.aspx) and place it in the root directory of this repo.

* Edit `debian/control`; enter your own name and email address in the `Maintainer:` field.

* Create a new debian/changelog file using the provided update.sh script:
```sh
./update.sh
```

* Build the package with the following command (it will use `fakeroot` internally, no need to wrap it):

```sh
debuild -us -uc -b
```

Installing
----------

Install the package with the `dpkg` command:

```sh
dpkg -i supermicro-update-manager...
```

Alternatively, you can create your own [simple repo](https://wiki.debian.org/DebianRepository/HowTo/TrivialRepository) or 
[more professional one](https://wiki.debian.org/SettingUpSignedAptRepositoryWithReprepro) to host your custom `deb` packages.
