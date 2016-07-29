package {'nginx':
	ensure => present,
	name   => nginx,
}
service {'nginx':
	ensure => true,
	name   => 'nginx',
	enable => true,
}
