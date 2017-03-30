# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
  $public_url = barometer::collectd::public_url,
  $ceilo_username = barometer::collectd::ceilo_username,
  $ceilo_password = barometer::collectd::ceilo_password,
) {
  file { '/etc/collectd/collectd.conf.d/collectd-ceilometer-plugin.conf':
    ensure => file,
    content => template('barometer/collectd.conf.erb'), 
  }
  file { '/etc/collectd/collectd.conf.d/hugepages.conf':
    ensure => file,
    content => template('barometer/hugepages.conf.erb'),
  }
#  file { '/etc/collectd/collectd.conf.d/mcelog.conf':
#    ensure => file,
#    content => template('barometer/mcelog.conf.erb'),
#  }
#  file { '/etc/mcelog/mcelog.conf':
#    ensure => file,
#    content => template('barometer/mcelog-client.conf.erb'),
#  }
  file { '/etc/collectd/collectd.conf.d/ovs.conf':
    ensure => file,
    content => template('barometer/ovs.conf.erb'),
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

