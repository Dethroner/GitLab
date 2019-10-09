# Dethroner
## Install GitLab in Debian.

1. Install base configuration Debian. Login as <b>root</b>.<br>
2. Install Git:
```
apt install git
```
3. Clone repository:
```
cd /tmp
git clone https://github.com/Dethroner/GitLab
chmod -R +x ./GitLab
```
4. Install GitLab
```
cd ./GitLab
sh Install_GitLab.sh
```