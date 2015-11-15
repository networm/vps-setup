#!/bin/bash



# config
sshport="16741"
iptables_index=8

# ssh
sed -i "s/^#Port 22/Port $sshport/" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i "s/^PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
systemctl restart sshd

# iptables
iptables -I INPUT $iptables_index -p tcp -m state --state NEW --dport $sshport -j ACCEPT
service iptables save
