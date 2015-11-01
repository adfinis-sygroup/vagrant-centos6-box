yum -y erase kernel-firmware postfix sendmail slang kernel.x86_64
yum -y install plymouth grub
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso

# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
rm /etc/udev/rules.d/70-persistent-net.rules

# No man
rm -rf /usr/share/man/*
rm -rf /usr/share/info/*
rm -rf /usr/share/doc/*

# No logos
rpm -ql redhat-logos | grep -v grub | xargs rm

/etc/init.d/sshd stop
reboot
exit 0
