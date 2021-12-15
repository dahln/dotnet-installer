#!/bin/bash

echo 'Install .NET 6 SDK - Install/Setup Script'

dotnetver=6.0
sdkfile=/tmp/dotnetsdk.tar.gz

download() {
    [[ $downloadspage =~ $1 ]]
    linkpage=$(wget -qO - https://dotnet.microsoft.com${BASH_REMATCH[1]})

    matchdl='id="directLink" href="([^"]*)"'
    [[ $linkpage =~ $matchdl ]]
    wget -O $2 "${BASH_REMATCH[1]}"
}

detectArch() {
    arch=arm32
  
    if command -v uname > /dev/null; then
        machineCpu=$(uname -m)-$(uname -p)

        if [[ $machineCpu == *64* ]]; then
            arch=arm64
        fi
    fi
}


if [[ $EUID -ne 0 ]]; then
   echo -e "\e[1;31mThis script must be run as root (sudo $0)" 
   exit 1
fi

echo 'Installing Dependencies'
apt install libunwind8 gettext -y



echo 'Cleaning up old files'
rm -f $sdkfile



echo "Downloading .NET SDK $dotnetver"
[[ "$dotnetver" > "5" ]] && dotnettype="dotnet" || dotnettype="dotnet-core"
downloadspage=$(wget -qO - https://dotnet.microsoft.com/download/$dotnettype/$dotnetver)
detectArch
download 'href="([^"]*sdk-[^"/]*linux-'$arch'-binaries)"' $sdkfile



echo 'Creating /opt/dotnet directory'
if [[ -d /opt/dotnet ]]; then
    echo "/opt/dotnet already exists"
else
    mkdir /opt/dotnet
fi



echo "Extracing .NET SDK version $dotnetver"
tar -xvf $sdkfile -C /opt/dotnet/



echo 'Linking to user profile'
ln -s /opt/dotnet/dotnet /usr/local/bin



echo 'Updating Path'
if grep -q 'export DOTNET_ROOT=' /home/pi/.bashrc;  then
  echo '.bashrc'
else
  echo 'Updating .bashrc'
  echo 'export DOTNET_ROOT=/opt/dotnet' >> /home/pi/.bashrc
fi



dotnet --info
echo 'Finished'
