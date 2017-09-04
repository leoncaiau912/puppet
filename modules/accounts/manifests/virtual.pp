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
}

