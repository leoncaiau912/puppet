exec {command:
		command => 'mktemp "/tmp/tmp.XXXX"',
		path    => '/bin:/sbin:/usr/bin:/usr/sbin',
}
