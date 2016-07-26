class nginx {
	package {'nginx':
		ensure => present,
	}
	service {'nginx':
		ensure => true,
		require => Package['nginx'],
		}
}
include nginx
