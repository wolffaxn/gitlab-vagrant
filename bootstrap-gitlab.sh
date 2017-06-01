#!/usr/bin/env bash

# install GitLab CE
sudo yum install -y postfix openssh-server

sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl enable postfix
sudo systemctl start postfix

cd /tmp
curl -O https://downloads-packages.s3.amazonaws.com/centos-7.1.1503/gitlab-ce-7.10.4~omnibus-1.x86_64.rpm
sudo rpm -ivh gitlab-ce-7.10.4~omnibus-1.x86_64.rpm
