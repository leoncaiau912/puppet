if $operatingsystem == 'CentOS' {
	notify {'centos':message => "Welcome to CentOS Linux."}
}elsif $operatingsystem =='RedHat' {
	notify {'redhat':message => "Welcome to RedHat Linux."}
}elsif $operatingsystem =='Ubuntu' {
	notify {'ubuntu':message=> "Welcome to Ubuntu Linux."}
}else{
	notify{'unkown':message=> "Unknown Operating System."}
}
