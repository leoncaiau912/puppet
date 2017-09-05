node 'node' {
	include sudo,ssh,postfix,mysql,apache,accounts
	
	apache::vhost { 'www.example.com':
		port => 80,
		docroot => '/var/www/www.example.com',
		ssl => false,
		priority => 10,
		serveraliases => 'home.example.com',
	}
	User <| title == "mysql1" |>
	Group <| title == "webuser" |>
	User <| title == "leon1" |>
}
