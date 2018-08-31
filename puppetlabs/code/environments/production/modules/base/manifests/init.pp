class base {

  $pacotes1 = [ "git", "vim", "sl", "figlet", "cowsay" ]

  case $::osfamily {
    "RedHat" : {
      $pacotes = [ $pacotes1, "epel-release" ]
      $web = "httpd"
    }

    "Debian" : {
      $pacotes = [ $pacotes1, "htop" ]
      $web = "apache2"
    }
  }

  package { $pacotes:
    ensure => absent
  }

  file { "/root/.bashrc" :
    source => "puppet:///modules/base/bashrc_base",
    ensure => present
  }
}
