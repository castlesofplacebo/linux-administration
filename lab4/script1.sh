#!/bin/bash
#1
dnf group install "Development tools"
#checking
gcc --version

#2
cp /mnt/share/bastet-0.43.tgz bastet/
cd bastet
tar zxvf bastet*
rm -rf bastet-0.43.tgz
cd bastet*

yum install boost-devel
yum install ncurses-devel
make

nano Makefile
install:
	cp ~/bastet/bastet-0.43/bastet /usr/bin/ && chmod a+x /usr/bin/bastet

make install

#3
cd ~
yum list all > task3.log

#4
yum deplist gcc > task4.log
yum deplist libgcc > task4_2.log

#5
mkdir localrepo
cp /mnt/share/check* localrepo/
yum install createrepo
createrepo localrepo

cd /etc/yum.repos.d
nano localrepo.repo
[localrepo]
name=localrepo
mirrorlist=file:///root/localrepo
enabled=0
gpgcheck=0

#6
yum repolist enabled > task6.log

#7
ls | xargs -i mv {} {}_new
mv localrepo.repo_new localrepo.repo
yum list #checking for only one avaliable package
yum install checkinstall

#8




