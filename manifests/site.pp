file {'/tmp/example-ip':                                            # resource type file and filename
  ensure  => present,                                               # make sure it exists
  mode    => 0644,                                                  # file permissions
  content => "Here is my Public IP Address: ${ipaddress_eth0}.\n",  # note the ipaddress_eth0 fact
}
file { "sshdconfig":
  name => $operatingsystem ? {
#  solaris => "/usr/local/etc/ssh/sshd_config",
  Ubuntu => "/usr/local/etc/ssh/sshd_config",
  default => "/etc/ssh/sshd_config",
  },
  owner => root,
  group => root,
  mode  => 0644,
}

Exec { path => "/usr/bin:/bin:/usr/sbin:/sbin" }
exec { "echo this works": }

class unix {
    file {
        "/etc/passwd": 
            owner => "root", 
            group => "root", 
            mode  => 0644;
        "/etc/shadow": 
            owner => "root", 
            group => "root", 
            mode  => 0440;
    }
}

class ubuntu inherits unix {
  File["/etc/passwd"] { group => wheel }
  File["/etc/shadow"] { group => wheel }
}



file { "/var/www/my/file":
    source => "/tmp/example-ip",
    mode   => 0666
}

group { "hmy":
           gid => 99;
          }

user { "leon":
    uid => 99,
    gid => 99,
    password => '$1$15PWKWxD$12rG000izZizDDW2/jRgU1',
    home => "/home/leon",
    shell => "/bin/bash";
}


package {
   ["vim","iproute","x-window-system","fcitx","netenv","xtrlock","ssh-askpass","mplayer","rxvt-unicode","curl","mtr"]:
    ensure => installed;
    ["pppoe","pppoe-conf"]:
    ensure => absent;
    }


#service { 
#            "ssh":
#             ensure => running;
#            "apache2":
#             ensure => stopped;
#           }

cron { logrotate:
    command => "/usr/sbin/logrotate",
    user => root,
    hour => 2,
    minute => 0
}
cron { logrotate1:
    command => "/usr/sbin/logrotate",
    user => leon,
    hour => ['2-4'],
    minute => '*/10'
}


host { 'node.example.com':
	ip => '192.168.227.200',
	host_aliases => 'node',
	ensure => 'present',
}

host { 'server.example.com':
	ip => '192.168.227.100',
        host_aliases => ["server","puppet"],
        ensure => 'present',
}


#install cron module
#puppet module install torrancew-cron
#https://github.com/torrancew/puppet-cron
include cron
cron::job{
  'mysqlbackup':
    minute      => '40',
    hour        => '2',
    date        => '*',
    month       => '*',
    weekday     => '*',
    user        => 'root',
    command     => 'mysqldump -u root mydb',
    environment => [ 'MAILTO=root', 'PATH="/usr/bin:/bin"' ];
}
#root@node:/etc/cron.d# cat mysqlbackup



exec { "tar xvf /my/tar/file.tar":
    cwd => "/var/tmp",
    creates => "/var/tmp/myfile",
    path => ["/bin", "/usr/sbin"]
}



#exec { "logrotate":
#    path => "/usr/bin:/usr/sbin:/bin",
#    onlyif => "test `du /var/log/syslog | cut -f1` -gt 10"
#}


include motd,puppet
include motd::file2
#root@server:/etc/puppet/modules/motd/manifests# vi init.pp
include motd::dir1
include motd::dir2


import 'nodes.pp'
