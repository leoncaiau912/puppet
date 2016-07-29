case $operatingsystem {
	        /^(?i-mx:redhat|centos|fedora)/: {package {'httpd': ensure => yum, }}
		        /^(?i-mx:ubuntu|debian)/: {package {'apache2': ensure => apt, }}
			        defalt: {notify {'notice': message => "Unkown system."}}
        }
