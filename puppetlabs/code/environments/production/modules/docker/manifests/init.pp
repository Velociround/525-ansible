
class docker {

  $pacotes = [ 'apt-transport-https', 'ca-certificates', 'curl', 'software-properties-common' ]
  $distro = $facts['os']['distro']['codename']
  $repositorio = "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add - ; /usr/bin/add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $distro stable' ; /usr/bin/apt update  "

  package { $pacotes :
    ensure => present
  }

  exec { 'Adicionando repo' :
    command => $repositorio
  }

  package { 'docker-ce' :
    ensure => present
  }

  service { 'docker' :
    ensure => running,
    enable => true,
    require => Package['docker-ce']
  }

}
