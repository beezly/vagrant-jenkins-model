node default {
  include epel
  include jenkins
  include jenkins::master
  
  $packages = ['git','libyaml-devel','libffi-devel','autoconf','gcc-c++','patch','readline-devel','zlib-devel','openssl-devel','automake','libtool','bison']
  
  package {$packages:
    ensure => "installed",
  }
    
  $jenkins_plugins = ['git','git-client','scm-api','token-macro','rvm','ruby-runtime']  
    
  jenkins::plugin{$jenkins_plugins:
    version => "latest",
  } 
  
  service{"iptables":
    ensure => "stopped",
    enable => "false"
  }
  
}