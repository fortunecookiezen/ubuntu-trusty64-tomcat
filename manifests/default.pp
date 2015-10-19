# Debian/Ubuntu default.pp.
# Creates a java 7/tomcat 7 server
# phillips.james@gmail.com

exec { 'apt-get update':
  command => 'apt-get update',
  path    => '/usr/bin/',
  timeout => 60,
  tries   => 3
}

package {
  [
    'curl',
    'ruby',
    'unzip',
    'maven',
    'openjdk-7-jdk',
    'tomcat7'
  ]:
  ensure => 'installed',
  require => Exec['apt-get update'],
}

exec { "updatedb":
    command => "updatedb",
    path    => "/usr/bin/",
    require => Exec['apt-get update'],
    #update the mlocate database so that the locate command works
}
