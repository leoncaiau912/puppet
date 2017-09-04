node 'node' {
	include sudo,ssh,postfix,mysql,apache
	
	apache::vhost { 'www.example.com':
		port => 80,
		docroot => '/var/www/www.example.com',
		ssl => false,
		priority => 10,
		serveraliases => 'home.example.com',
	}
}
