#!/bin/bash
set -e
set -x

if [ -f /etc/disk_added_date ]
then
   echo "Already provisioned so exiting."
   exit 0
fi


sudo fdisk -u /dev/sdb <<EOF
n
p
1


t
8e
w
EOF

pvcreate /dev/sdb1
vgextend centos /dev/sdb1
lvextend --resize -L +${1}MB /dev/centos/root

date > /etc/disk_added_date
