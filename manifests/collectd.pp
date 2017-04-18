# == Class: ::barometer::collectd
# Add configuration files for all components.
# Start collectd service 

class barometer::collectd (
  $auth_url = barometer::collectd::auth_url,
  $collectd_username = barometer::collectd::collectd_username,
  $collectd_password = barometer::collectd::collectd_password,
) {
  file { '/etc/collectd/collectd.conf.d/collectd-ceilometer-plugin.conf':
    ensure => file,
    content => template('barometer/collectd-ceil.conf.erb'),
  }
  file { '/etc/collectd/collectd.conf.d/intel_rdt.conf':
    ensure => file,
    content => template('barometer/intel_rdt.conf.erb'),
  }
  file { '/etc/collectd/collectd.conf.d/logfile.conf':
    ensure => file,
    content => template('barometer/logfile.conf.erb'),
  }
  file { '/etc/collectd.conf':
    ensure => file,
    content => template('barometer/collectd.conf.erb'), 
  }
  file { '/etc/collectd/collectd.conf.d/hugepages.conf':
    ensure => file,
    content => template('barometer/hugepages.conf.erb'),
  }
  file { '/etc/collectd/collectd.conf.d/mcelog.conf':
    ensure => file,
    content => template('barometer/mcelog.conf.erb'),
  }
  file { '/etc/mcelog/mcelog.conf':
    ensure => file,
    content => template('barometer/mcelog-client.conf.erb'),
  }
  file { '/etc/collectd/collectd.conf.d/ovs.conf':
    ensure => file,
    content => template('barometer/ovs.conf.erb'),
  }
  # Add path to libpqos
  file { '/etc/ld.so.conf.d/pqos.conf':
    ensure => file,
    content => template('barometer/pqos.conf.erb'),
  }
  service { 'collectd':
    ensure => 'running',
    enable => true,
  }
}

