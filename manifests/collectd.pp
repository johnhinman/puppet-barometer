# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
  $public_url,
  $ceilo_username,
  $ceilo_password,
) {
  exec { 'show ceilometer creds':
    path => '/usr/bin',
    command => 'echo $public_url $ceilo_username $ceilo_password > /home/collectd-creds',
  }
  exec { 'collectd-ceilometer-plugin conf':
    path => '/usr/bin',
    command => 'bash /opt/collectd-conf.sh $public_url, $ceilo_username, $ceilo_password > /home/collectd-conf-status',
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

