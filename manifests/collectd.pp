# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
  $public_url = barometer::collectd::public_url,
  $ceilo_username = barometer::collectd::ceilo_username,
  $ceilo_password = barometer::collectd::ceilo_password,
) {
  exec { 'collectd-ceilometer-plugin conf':
    path => '/usr/bin',
    command => "bash /opt/collectd-conf.sh $public_url $ceilo_username $ceilo_password > /home/collectd-conf-status",
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

