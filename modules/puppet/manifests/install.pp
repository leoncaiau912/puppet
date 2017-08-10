class puppet::install{
  include puppet::puppet_install,puppet::facter_install
}
class puppet::puppet_install{
  package { 'puppet':
    ensure => $operatingsystemmajrelease ?{ 
      14.04 => '3.8.7-1puppetlabs1',
      6 => '2.7.25-1.el6',
    }
  }
}
class puppet::facter_install{
  package { 'facter':
    ensure => $operatingsystemmajrelease ?{
      14.04 => '2.4.6-1puppetlabs1',
      6 => '1.7.5-1.el6',
    }
  }
}
