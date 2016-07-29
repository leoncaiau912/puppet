
case $operatingsystem {
	        'Solaris':      {notice("Welcome to Solaris")}
		        'RedHat','CentOS': {notice("Welcome to RedHat OS")}
			        /^(Debian|Ubuntu)$/: {notice("Welcome to $1 linux")}
				        default:        {notice ("Welcome, alien *.*")}
					        }

