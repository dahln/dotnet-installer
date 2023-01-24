# dotnet-installer
Install .NET on a Raspberry Pi.

Microsoft does not support installing the dotnet SDK on ARM devices using a package manager. See the Microsoft documentation for details. To install the dotnet SDK on an ARM device, you can download the SDK and manually install it. This script downloads the file, extracts the contents to the correct folder location, and updates the OS path referenes. The 'uninstall' remove the SDK.

Tested on Raspberry Pi 4, running Raspberry Pi OS.

There are two ways to run the files:
 - Download and run the files
 - OR
 - Use Git to clone the repo, then run the files

When a minor .NET update is published, simple run the "uninstaller.sh" script and then run the latest "installer-x.0.sh" script. For example, if you are currently running 6.0.2, run the uninstall and then the install, 6.0.3 should now be installed. Verify with "dotnet --info".

## Download and run the files (Recommended)

#### dotnet 7
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer-7.0.sh | sudo bash
```
#### dotnet 6
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer-6.0.sh | sudo bash
```
#### dotnet 5
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer-5.0.sh | sudo bash
```
#### uninstaller - all versions
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/uninstaller.sh | sudo bash
```
## If you prefer to clone and run the files manually, do this:
```
apt install git -y
git clone https://github.com/dahln/dotnet-installer
```
If you clone the project, you will need to grant execution permissions to the files:
```
sudo chmod +x installer-7.0.sh
sudo chmod +x uninstaller.sh
```
Run the commands like this:
```
sudo ./installer-7.0.sh 
```


## Attribution
This project referenced and reused parts of this project: https://github.com/pjgpetecodes/dotnet5pi
