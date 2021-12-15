# dotnet-installer
Install .NET on a Raspberry Pi.

## You need to copy these files to your device
Download and run the files (Recommended)

#### dotnet 5
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer-5.0.sh | sudo bash
```
#### dotnet 6
```
wget -O - https://raw.githubusercontent.com/dahln/dotnet-installer/master/installer-6.0.sh | sudo bash
```
#### uninstaller - all versions
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
sudo chmod +x installer-6.0.sh
sudo chmod +x uninstaller.sh
```
Runn the commands like this:
```
sudo ./installer-6.0.sh 
```


#### Attribution:
This project referenced and reused parts of this project: https://github.com/pjgpetecodes/dotnet5pi
