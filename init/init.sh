#!/bin/bash



# config
hostname="your-vps"
domainname="your-domain"
ip="your-ip"

# update
yum update -y

# set hostname
hostnamectl set-hostname $hostname

# update hosts
echo -e "127.0.0.1 localhost.localdomain localhost\n$ip $domainname $hostname" > /etc/hosts

# set time
timedatectl set-timezone 'Asia/Shanghai'
