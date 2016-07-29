file {'/tmp/test4.txt':
	ensure  => file,
	content => "hello puppet."
}

exec {'monitor':
	command   => 'echo "/tmp/test4.txt changed." >> /tmp/monitor.txt',
	subscribe => File['/tmp/test4.txt'],
	path      => '/bin/'
}

