# == Class: salt::server
#
# This class installs and manages the Salt Master daemon.
#
# === Parameters
#
# === Actions
#
# - Install salt-master package
# - Configure Salt to auto-accept minion key requests
# - Ensure salt-master daemon is running

# === Requires
#
# === Sample Usage
#
#   class { 'salt::server': }
#
class salt::server {

  Class['salt::server'] -> Class['salt']

  package { 'salt-master':
    ensure => latest,
  }

  file { 'master.conf':
    path    => '/etc/salt/master',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    source  => 'puppet:///modules/salt/master.conf',
    require => Package[ 'salt-master' ],
    before  => Service[ 'salt-master' ],
  }

  service { 'salt-master':
    enable => true,
    ensure => running,
  }

}
