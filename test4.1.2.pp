file {'/tmp/test4.txt':
audit  => 'content',
notify => Exec['my_command.sh'],
}
exec {"my_command.sh":
 command           => 'echo "/tmp/test4.txt changed." >> /tmp/monitor.txt',
         subscribe => File['/tmp/test4.txt'],
	         path     => '/bin/'
}

