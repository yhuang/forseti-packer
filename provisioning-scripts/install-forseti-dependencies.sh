#!/usr/bin/env bash

yum install -y \
autoconf \
bind-utils \
bzip2 \
cmake \
curl \
curl-devel \
dstat \
gcc \
gcc-c++ \
gettext-devel \
http-parser \
iftop \
iotop \
iptraf \
kernel-devel \
kernel-headers \
libffi-devel \
libpcap-devel \
lsof \
make \
mysql-devel \
nano \
net-tools \
nfs-utils \
nmap \
nmap-ncat \
ntp \
openssl-devel \
patch \
perl \
perl-CPAN \
perl-devel \
python-devel \
python-pip \
python-requests \
python-setuptools \
selinux-policy-devel \
sudo \
sysstat \
tcpdump \
texinfo \
telnet \
traceroute \
unzip \
vim \
wget \
yum-utils \
zlib-devel \
zsh

yum groupinstall -y "Development Tools"

yum install -y epel-release
yum-config-manager --disable epel

yum --disablerepo="*" --enablerepo="epel" install -y \
jq \
python-pip

# umask 0022 would make the new mask 0644 (0666-0022=0644) meaning that
# group and others have read (no write or execute) permissions. The "extra"
# digit (the first number = 0), specifies that there are no special modes.
CURRENT_UMASK=$(umask)
umask 0022

pip install --upgrade pip
pip install -q --upgrade setuptools wheel
pip install -q --ignore-installed --upgrade -r /tmp/requirements.txt

umask $CURRENT_UMASK
