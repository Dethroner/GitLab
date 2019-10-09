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
4. Install GitLab. !!!Before starting the installation, edit the Vars block for you.
```
cd ./GitLab
sh Install_GitLab.sh
```
## Install GitLab runner in Docker (All on one server).

1. Get token from your GitLab site. !!!Before starting the installation, edit the Vars block for you.<br>
2. Install Docker and start GitLab runner with your token:
```
sh Install_GitLab_runner_Docker.sh
```
3. I check on the site that the runner has been added and works.