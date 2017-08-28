class motd{                 #定义一个类叫motd
  package{ 'ntp':    #定义package资源
    ensure => present,  #要求setup这个包处于被安装状态
  }
  file{ '/etc/motd':  #定义file资源
    ensure  => present,  #要求file文件处于存在状态
    owner   => 'root', #要求file文件属主为root
    group   => 'root', #要求file文件属组为root
    mode    => '0644', #要求file文件权限为644
    source  => "puppet://$puppetserver/modules/motd/etc/motd", #要求file文件从puppetmaster端服务器下载
    require => Package['ntp'], #要求文件被配置之前先执行package资源
  }
}

class motd::file2 {
  file{ "/etc/file2":
    owner  => "puppet",
    group  => "puppet",
    ensure => link,
    target => "/etc/passwd",
  }
}

class motd::dir1 {
  file{ "/etc/dir1":
    owner   => "puppet",
    group   => "puppet",
    mode    => 0700,
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    ignore  => "dir2",
  }
  notify { "This is dir1！":
#   withpath => true,
  }
}

class motd::dir2 {
  file{ "/etc/dir2":
    owner   => "puppet",
    group   => "puppet",
    mode    => 0700,
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
    ignore  => "dir1",
  }
}
