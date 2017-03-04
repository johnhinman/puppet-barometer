# == Class: ::barometer::rdt
# RDT preparation: ldconfig and load msr module

class barometer::rdt (
) {
  exec { 'update linker cache':
    path => '/usr/sbin',
    command => 'ldconfig',
  }
  exec { 'load MSR module':
    path => '/usr/sbin',
    command => 'modprobe msr',
  }
}

