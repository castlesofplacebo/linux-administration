#!/bin/sh
#1
cd ~
mkdir test

#2
cd test
ls -a -l -F /etc > list

#3
subdirs=$(ls -a -l /etc | grep ^d | wc -l)
echo "3. Count of subdirs in /etc: $subdirs" >> list
hidden_files=$(find /etc -maxdepth 1 -name '.*' | wc -l)
echo "3. Count of hidden files in /etc: $hidden_files" >> list

#4
mkdir links

#5
cd links
ln ../list list_hlink

#6
ln -s ../list list_slink

#7
echo "7. Hard links list_hlink: $(ls -l list_hlink | awk '{print $2}')"
echo "7. Hard links list_slink: $(ls -l list_slink | awk '{print $2}')"
cd ..
echo "7. Hard links list: $(ls -l list | awk '{print $2}')"

#8
cd links
cat ../list | wc -l >> list_hlink

#9
cmp -s list_hlink list_slink && echo "9.YES" || echo "9.NO"

#10
cd ..
mv list list1

#11
cd links
cmp -s list_hlink list_slink && echo "11.YES" || echo "11.NO"

#12
cd ~
ln ~/test/list1 list_link

#13
find /etc -name '*.conf' > list_conf

#14
find /etc -maxdepth 1 -name '*.d' > list_d

#15
cat list_conf > list_conf_d
cat list_d >> list_conf_d

#16
cd test
mkdir .sub

#17
cd /.sub
cp ~/list_conf_d ~/test/.sub

#18
cp --backup=simple ~/list_conf_d ~/test/.sub

#19
cd ~/test
echo "All files in test: $(ls -a -R)"

#20
cd ~
man man > man.txt

#21
split man.txt -b 1K

#22
mkdir man.dir

#23
mv x* ./man.dir

#24
cd man.dir
cat x* > man.txt

#25
cmp -s man.txt ~/man.txt && echo "25.YES" || echo "25.NO"

#26
cd ~
sed -i '1s/^/some text to beggining\nalso some text\n/' man.txt
echo -e "some text to the end\nalso some text" >> man.txt

#27
diff -u ~/man.dir/man.txt man.txt > file_diff.diff

#28
mv file_diff.diff ~/man.dir

#29
cd man.dir
patch -s man.txt < file_diff.diff

#30
cmp -s man.txt ~/man.txt && echo "30.YES" || echo "30.NO"
