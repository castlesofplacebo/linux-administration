#!/bin/bash
#1
awk -F: '{print "user " $1 " has id " $3}' /etc/passwd > work3.log

#2
chage -l root | awk 'NR == 1' >> work3.log

#3
awk -F: 'BEGIN { ORS = "," }{print $1}' /etc/group >> work3.log
echo -e "\n" >> work3.log

#4
echo "Be careful!" > readme.txt
mv readme.txt /etc/skel

#5
useradd -p $(openssl passwd -crypt 12345678) u1

#6
groupadd g1

#7
usermod -aG g1 u1

#8
id u1 >> work3.log

#9
usermod -aG user g1

#10
cat /etc/group | grep g1 | awk -F: '{print $4}' >> work3.log

#11
usermod --shell /usr/bin/mc u1

#12
useradd -p $(openssl passwd -crypt 87654321) u2

#13
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log

#14
groupadd g2
usermod -aG g2 u1
usermod -aG g2 u2

chown u1:g2 /home/test13
chmod 750 /home/test13
#-rwxr-x--- to dir
chmod -R 640 /home/test13
#-rw-r----- to files

#15
mkdir /home/test14

chown u1:u1 /home/test14
chmod +t /home/test14

#16
cp /bin/nano /home/test14
chown u1:u1 /home/test14/nano
chmod a+x,u+s /home/test14/nano

#17
mkdir /home/test15
echo "Test" > /home/test15/secret_file
chmod -R 444 /home/test15
chmod 111 /home/test15
