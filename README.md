# dotnet-installer
Install .NET for ARM on a Raspberry PI.

## You need to copy these files to your device
Download the files directly from git (Recommended)
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer.sh | sudo bash
```
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/uninstaller.sh | sudo bash
```
### OR 

Either install git on your device:
```
apt install git -y
git clone https://github.com/dahln/dotnet-installer
```
If you clone the project, you will need to grant execution permissions to the files:
```
sudo chmod +x installer.sh
sudo chmod +x uninstaller.sh
```


#### Attribution:
This project referenced and reused parts of this project: https://github.com/pjgpetecodes/dotnet5pi
