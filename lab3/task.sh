#!/bin/bash
cat /etc/passwd | awk -F: '{print $1}' |
while read line; do echo -n $line; chage -l $line |
head -n 1 |
awk -F: '{print $2}'; done | sort -k 2 | awk 'NR==1'
