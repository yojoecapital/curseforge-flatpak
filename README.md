# curseforge-flatpak

This is a fork of https://github.com/hurricane-src/curseforge-flatpak. I'm just tweaking it a bit so that there is 1 script to build and install the Flatpak. I am also blocking common Ad hosts from the sandbox.

## Prerequisites

The following must be present in the PATH.

```
flatpak-builder
dpkg-deb
wget
```

The following Flatpak dependencies must be installed (version 24.08):

```
flatpak install flathub org.freedesktop.Sdk
flatpak install flathub org.freedesktop.Platform
```

## Building and installing

To build and install, run the following command. You can also run this to update the Flatpak.

```
./build-install.sh
```
