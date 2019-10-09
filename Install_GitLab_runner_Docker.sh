#!/bin/bash
##################################################
# Install GitLab                                 #
# Author by Dethroner, 2019                      #
################################################## 

### Vars
export url="gitlab.example.lan"
export token="M-tECnuLa_xeffbV_L6x"

### Install runner
echo "Install Docker..."
apt remove docker docker-engine docker.io containerd runc
apt update
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io 

### Start & register runner
echo "Start GitLab runner in Docker & register..."
echo "Manual for registration runner https://docs.gitlab.com/runner/register/index.html"

docker run -d --name gitlab-runner --restart always \
-v /srv/gitlab-runner/config:/etc/gitlab-runner \
-v /var/run/docker.sock:/var/run/docker.sock \
gitlab/gitlab-runner:latest

docker exec -it gitlab-runner gitlab-runner register \
  --non-interactive \
  --url "http://$url" \
  --registration-token "$token" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "my-runner" \
  --tag-list "docker" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"