#!/bin/bash
##################################################
# Install GitLab                                 #
# Author by Dethroner, 2019                      #
################################################## 

### Vars
export url="gitlab.test.lan"
hostnamectl set-hostname $url --static

### Install
echo "Install upgrades & pre-package..."
apt update && apt upgrade
apt install -y curl openssh-server ca-certificates postfix

echo "Install GitLab..."
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
EXTERNAL_URL="http://$url" apt install gitlab-ce

echo "Start GitLab..."
/usr/bin/gitlab-ctl reconfigure