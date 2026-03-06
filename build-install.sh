#!/bin/sh

set -e

echo "STEP 1: Cleaning files..."

rm -rf files .flatpak-builder
rm -f *.deb

echo "STEP 2: Downloading files..."

DEB=curseforge-latest-linux.deb
URI="https://curseforge.overwolf.com/downloads/$DEB"

command -v dpkg-deb >/dev/null || { echo "ERROR: dpkg-deb not found"; exit 1; }
command -v wget >/dev/null || { echo "ERROR: wget not found"; exit 1; }

if [ ! -d files ]; then
  if [ ! -f "$DEB" ]; then
    wget -c "$URI"
  fi

  dpkg-deb -x "$DEB" files
fi

if [ -d files/opt/CurseForge ]; then
  mv files/opt/CurseForge/* files/ 2>/dev/null
  rm -rf files/opt
  rm -rf files/usr
fi

if [ -f files/curseforge ]; then
  echo "CurseForge appears to have been prepared properly"
else
  echo "CurseForge doesn't appear to be properly installed"
  echo "Delete the 'files' directory"
  echo "If you've already tried that delete the $DEB file too"
fi

echo "STEP 3: Building and installing..."
flatpak-builder --user --install --force-clean build-dir com.curseforge.app.yaml