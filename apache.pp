node default {
$docroot = '/var/www/html'
	include apache

        apache::vhost { '127.0.0.1':

                servername => 'localhost',
                port    => '8001',
                docroot => $docroot,
                docroot_owner => 'www-data',
                docroot_group => 'www-data',
            }   
	


file { "${docroot}/info.php":                                # file resource name
    path => "${docroot}/info.php",               # destination path
    ensure => file,
    require => Class['apache'],                     # require apache class be used
    source => 'puppet:///modules/apache/info.php',  # specify location of file to be copied
  }
}
