# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
) {
  service { 'collectd':
    ensure => 'running',
    enable => true,
  }
  exec { 'show collectd status':
    path => '/usr/sbin',
    command => 'service collectd status > /home/collectd-status',
  }
}

