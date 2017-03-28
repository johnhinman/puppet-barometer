# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
  $public_url = barometer::collectd::public_url,
  $ceilo_username = barometer::collectd::ceilo_username,
  $ceilo_password = barometer::collectd::ceilo_password,
) {
  file { '/etc/collectd/collectd.conf.d/collectd.conf':
    ensure => file,
    content => template('barometer/collectd.conf.epp'), 
  }
  service { 'collectd':
    ensure => 'running',
    enable => true,
  }
  exec { 'show collectd status':
    path => '/usr/sbin',
    command => 'service collectd status > /etc/collectd/collectd-status',
  }
}

