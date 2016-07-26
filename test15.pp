class nginx {
	package {"nginxe":
		ensure => present,
	}
	}

class nginx::rproxy inherits nginx {
	file	{'/etc/nginx/nginx.conf':
		ensure => file,
		source => '/tmp/nginx/nginx.reverse_proxy.conf',
		notify => Service['nginx'],
	}
	service {'nginx':
		ensure => true,
	}
}

class nginx::web inherits nginx {
        file    {'/etc/nginx/nginx.conf':
                ensure => file,
                source => '/tmp/nginx/nginx.web.conf',
		force => true,
                notify => Service['nginx'],
        }
        service {'nginx':
                ensure => true,
        }
}

