#!/bin/bash

echo '---------------- Install .NET 8 SDK - Install/Setup Script ---------------'
echo 'For issues or suggestions, visit https://github.com/dahln/dotnet-installer'
echo '--------------------------------------------------------------------------'
dotnetver=8.0
sdkTar=/tmp/dotnetsdk.tar.gz

download() {
    [[ $downloadspage =~ $1 ]]
    linkpage=$(wget -qO - https://dotnet.microsoft.com${BASH_REMATCH[1]})

    matchdl='id="directLink" href="([^"]*)"'
    [[ $linkpage =~ $matchdl ]]
    wget -O $2 "${BASH_REMATCH[1]}"
}


if [[ $EUID -ne 0 ]]; then
   echo -e "==> This script must be run as root (sudo $0)" 
   exit 1
fi


echo '==> Installing Dependencies...'
apt install libunwind8 gettext -y


echo '==> Cleaning up old files...'
rm -f $sdkTar



echo "==> Downloading .NET SDK $dotnetver..."
downloadspage=$(wget -qO - https://dotnet.microsoft.com/download/dotnet/$dotnetver)
download 'href="([^"]*sdk-[^"/]*linux-arm64-binaries)"' $sdkTar



echo '==> Creating /opt/dotnet directory...'
if [[ -d /opt/dotnet ]]; then
    echo "/opt/dotnet already exists"
else
    mkdir /opt/dotnet
fi



echo "==> Extracing .NET SDK version $dotnetver..."
tar -xvf $sdkTar -C /opt/dotnet/



echo '==> Linking to user profile...'
ln -s /opt/dotnet/dotnet /usr/local/bin



echo '==> Updating Path...'
if grep -q 'export DOTNET_ROOT=' /root/.bashrc;  then
  echo '.bashrc already up-to-date'
else
  echo 'Updating .bashrc'
  echo 'export DOTNET_ROOT=/opt/dotnet' >> /root/.bashrc
fi



echo '==> Finished'
echo 'Rebooting is suggested'
echo 'run "dotnet --info" to test if SDK is correctly installed'
