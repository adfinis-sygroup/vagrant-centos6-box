yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y erase kernel-firmware redhat-logos postfix
yum -y erase gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils
yum -y install plymouth
yum -y clean all
rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf VBoxGuestAdditions_*.iso

# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
rm /etc/udev/rules.d/70-persistent-net.rules

# No man
rm -rf /usr/share/man/*
rm -rf /usr/share/info/*
rm -rf /usr/share/doc/*

# remove all locales that are not "en*"
find /usr/share/locale -type f -path "*/LC*" ! -path "*/en*" -exec rm {} \;
find /usr/share/locale -depth -type d -print0 | xargs -0 rmdir 2>/dev/null
find /usr/share/i18n/locales -type f ! \( -name "en*" -or -name "translit_*" -or -iname "POSIX" \) -exec rm {} \;
# rebuild locale-archive
# see http://bleachbit.sourceforge.net/forum/linux-fedora-core-15-usrliblocalelocale-archive-still-large-after-removing-all-one-locale
localedef --list-archive | grep -v ^en | xargs localedef --delete-from-archive
mv /usr/lib/locale/locale-archive{,.tmpl}
/usr/sbin/build-locale-archive
bash -c "sleep 1; reboot" &
true
