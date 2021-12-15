# dotnet-installer
Install .NET for ARM on a Raspberry PI.

## You need to copy these files to your device
Either install git on your device:
 - apt install git -y
 - git clone https://github.com/dahln/dotnet-installer

### OR 
 - Download the files directly from git
 - wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer.sh | sudo bash
 - wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/uninstaller.sh | sudo bash


## To run these scripts, you must first allow them execution rights
If you cloned the project, you will ned to grant exection permissions to the files:
 - sudo chmod +x installer.sh
 - sudo chmod +x uninstaller.sh


#### Attribution:
This project referenced and reused parts of this project: https://github.com/pjgpetecodes/dotnet5pi