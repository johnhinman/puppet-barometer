# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
) {
  exec { 'start collectd service':
    ensure => 'running',
    enable => true,
  }
  exec { 'show collectd start':
    path => '/usr/bin',
    command => 'pwd > /home/barom-puppet',
  }
}

