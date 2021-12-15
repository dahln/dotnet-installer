#!/bin/bash

echo '------------------ Uninstall .NET 6 (All Versions) SDK -------------------'
echo 'For issues or suggestions, visit https://github.com/dahln/dotnet-installer'
echo '--------------------------------------------------------------------------'

if [[ $EUID -ne 0 ]]; then
   echo -e "==> This script must be run as root (sudo $0)" 
   exit 1
fi

echo '==> Uninstalling...'

sudo rm -f /tmp/dotnetsdk.tar.gz
sudo rm -f /usr/local/bin/dotnet
sudo rm -f -r /opt/dotnet/

echo '==> Finished'