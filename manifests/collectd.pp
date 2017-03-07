# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
  $public_url = hiera(ceilometer::keystone::auth::public_url),
  $username   = hiera(ceilometer::keystone::authtoken::username),
  $password   = hiera(ceilometer::keystone::authtoken::password),
) {
  exec { 'show ceilometer creds':
    path => /usr/bin',
    command => 'echo "$public_url $username $password" > /home/collectd-creds',
  exec { 'collectd-ceilometer-plugin conf':
    path => /usr/bin',
    command => 'bash /opt/collectd-conf.sh public_url, username, password > /home/collectd-conf-status',
  }
  service { 'collectd':
    ensure => 'running',
    enable => true,
  }
  exec { 'show collectd status':
    path => '/usr/sbin',
    command => 'service collectd status > /home/collectd-status',
  }
}

