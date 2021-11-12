#!/bin/bash
rm -f work3.log

rm -f /etc/skel/readme.txt

userdel -r u1
groupdel g1

userdel -r u2
groupdel g2

rm -rf /home/test*

