# Zero out the free space to save space in the final image:
find /tmp/ -mindepth 1 -delete
find /var/tmp/ -mindepth 1 -delete
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
