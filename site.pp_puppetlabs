class { '::ntp':
  servers => [ '0.pool.ntp.org', '2.centos.pool.ntp.org', '1.rhel.pool.ntp.org'],
}

user { 'dave':
  ensure     => present,
  uid        => '507',
  gid        => '507',
  shell      => '/bin/bash',
  home       => '/home/dave',
  managehome => true,
}

group { 'dave':
  ensure => 'present',
  gid    => '507',
}

#include ::ssh::server

class { 'ssh::server':
options => {
'PermitRootLogin'        => 'no',
}
}

