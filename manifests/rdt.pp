# == Class: ::barometer::rdt
# RDT preparation: ldconfig and load msr module

class ::barometer::rdt {
  exec { 'update linker cache':
    path => '/usr/bin',
    command => 'sudo ldconfig',
  }
  exec { 'load MSR module':
    path => '/usr/bin',
    command => 'sudo modprobe msr',
  }
}

