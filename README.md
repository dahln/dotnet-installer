# dotnet-installer
Install .NET on an ARM64 LInux device. 32 bit not tested.

This script has been tested on:
 - Ubuntu 20.04 ARM64
 - Raspberry Pi 4 running Raspberry Pi OS

Microsoft does not support installing the dotnet SDK on ARM devices using a package manager. See the Microsoft documentation for details. To install the dotnet SDK on an ARM device, you can download the SDK and manually install it. This script downloads the file, extracts the contents to the correct folder location, and updates the OS path references. The updated path references will persist after reboot.



When a minor .NET update is published, simple run the "uninstaller.sh" script and then run the latest isntall script. For example, if you are currently running 6.0.2, run the uninstall and then the install, 6.0.3 should now be installed. Verify with "dotnet --info".

#### dotnet 8
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer-8.0.sh | sudo bash
```
#### uninstaller
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/uninstaller.sh | sudo bash
```


## Attribution
This project referenced and reused parts of this project: https://github.com/pjgpetecodes/dotnet5pi
