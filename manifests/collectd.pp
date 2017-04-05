# == Class: ::barometer::collectd
# Collectd service start 

class barometer::collectd (
  $auth_uri = barometer::collectd::auth_uri,
  $collectd_username = barometer::collectd::collectd_username,
  $collectd_password = barometer::collectd::collectd_password,
) {
  file { '/etc/collectd.conf':
    ensure => present,
  }->
  file_line { 'Append path to ceilometer plugin':
    path => '/etc/collectd.conf',
    content => inline_template('<%='<Include "/etc/collectd/collectd.conf.d">\n  Filter "*.conf"\n</Include>'%>'),
  }
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
  file { '/etc/ld.so.conf.d/pqos.conf':
    ensure => file,
    content => template('barometer/pqos.conf.erb'),
  }
  service { 'collectd':
    ensure => 'running',
    enable => true,
  }
  # debug only, remove this
  exec { 'show collectd status':
    path => '/usr/sbin',
    command => 'service collectd status > /etc/collectd/collectd-status',
  }
}

