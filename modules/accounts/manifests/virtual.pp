class accounts::virtual {
	@user { "mysql1":
		ensure => present,
		uid => 207,
		gid => 27,
		home => "/var/lib/mysql",
		shell => "/bin/bash",
	}

	@user { "apache1":
		ensure => present,
		uid => 48,
		gid => "apache",
		home => "/var/www",
		shell => "/sbin/nologin",
	}
	@user { "leon1":
		ensure => present,
		name => 'leon1',
		password => '$1$15PWKWxD$12rG000izZizDDW2/jRgU1',
		uid => 50,
#		perms => '0755',
		groups => [ 'webuser'],
		managehome => true,
	}
	@group {"webuser":
		ensure => present,
		gid => 222
	}
}

