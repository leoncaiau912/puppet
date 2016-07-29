file { '/etc/hosts':
	  audit => [ owner, group, mode ],
}
