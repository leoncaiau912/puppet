file {'/tmp/abc.txt':
	ensure  => present,
	content => 'Hello Puppet',
	#	path    => "/tmp",
}

file {'fstab.symbolic':
	ensure => present,
	target => "/etc/fstab",
	path   => "/tmp/fstab.symbolic",
}

