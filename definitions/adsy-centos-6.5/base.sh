# Base install
yum -y erase kernel-firmware postfix
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
yum -y upgrade
/etc/init.d/sshd stop
reboot
exit 0
