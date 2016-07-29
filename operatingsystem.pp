$package= $operatingssystem ?{
	/(?i-mx:ubuntu|debain)/	        => 'apache2',
	/(?i-mx:centos|fedora|redhat)/	 => 'httpd',
}
