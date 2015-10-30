Veewee::Session.declare({
  :cpu_count => '2',
  :memory_size=> '512',
  :disk_size => '40960',
  :disk_format => 'VDI',
  :hostiocache => 'on',
  :os_type_id => 'RedHat6_64',
  :iso_file => "CentOS-6.5-x86_64-netinstall.iso",
  :iso_src => "http://mirror.nsc.liu.se/centos-store/6.5/isos/x86_64/CentOS-6.5-x86_64-netinstall.iso",
  :iso_md5 => "939fd1d87c11ffe7795324438b85adfb",
  :iso_download_timeout => 1000,
  :boot_wait => "10",
  :boot_cmd_sequence => [
    '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => 300,
  :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [
    "base.sh",
    #"chef.sh",
    #"puppet.sh",
    "vagrant.sh",
    "virtualbox.sh",
    #"vmfusion.sh",
    "cleanup.sh",
    "modtrim.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => 10000
})
