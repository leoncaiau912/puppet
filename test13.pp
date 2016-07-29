class nginx {
  package {'nginx':
       ensure => present,
                 }
            service {'nginx':
                            ensure      => true,
		                                require => Package['nginx'],
				                        }
       }

       #class {'nginx':}
       include nginx
