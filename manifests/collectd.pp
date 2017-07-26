# Copyright 2017 Intel Corporation.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
  file { '/etc/collectd/collectd.conf.d/intel_rdt.conf_':
    ensure => file,
    content => template('barometer/intel_rdt.conf.erb'),
  }
  file { '/etc/collectd/collectd.conf.d/01-logfile.conf':
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
  service { 'mcelog':
    ensure => 'running',
    ensure => true,
  }
  service { 'collectd':
    ensure => 'running',
    enable => true,
  }
}

