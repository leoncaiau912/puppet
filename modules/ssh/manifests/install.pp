class ssh::install {
        package { "openssh":
                name => $operatingsystem ? {
                        /(Red Hat|CentOS|Fedora)/ => "openssh",
                        Ubuntu => "openssh-server",
                        default=> "openssh"
                 },
                 ensure => latest,
        }
}
