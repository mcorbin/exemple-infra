#!/usr/bin/env sh

mkdir /home/guix/.ssh
chown guix:guix /home/guix/.ssh
chmod 0700 /home/guix/.ssh

touch /home/guix/.ssh/authorized_keys
chown guix:guix /home/guix/.ssh/authorized_keys
chmod 0600 /home/guix/.ssh/authorized_keys
chmod 0600 /home/guix/.bash_profile

sudo rm /etc/guix/acl
sudo guix archive --authorize < $(sudo find / -name "ci.guix.gnu.org.pub")

guix pull
guix package -u

# root user configuration

sudo cp /home/guix/.bash_profile /root/.bash_profile
sudo chown root:root /root/.bash_profile
sudo chmod 0600 /root/.bash_profile

sudo guix pull
sudo guix package -u
