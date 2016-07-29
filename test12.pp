$webserver = $operatingsystem ? {
	        /^(?i-mx:centos|fedora|redhat)/ => 'httpd',
		        /^(?i-mx:ubuntu|debian)/       => 'apache2',
			        }
				$webprovider = $operatingsystem ? {
					        /^(?i-mx:centos|fedora|redhat)/ => 'yum',
						        /^(?i-mx:ubuntu|debian)/       => 'apt',
							        }

								package {"$webserver":
									        ensure    => present,
										        provider => "$webprovider",
								}

