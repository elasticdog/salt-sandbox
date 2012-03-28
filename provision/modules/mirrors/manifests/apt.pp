# == Class: mirrors::apt
#
# This class installs the Salt PPA APT repository.
#
# === Parameters
#
# === Actions
#
# - Install saltstack ppa repository
# - Perform initial sync to update package database
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors::apt': }
#
class mirrors::apt {

  $saltstack_key = '0E27C0A6'

  exec { 'apt_key_saltstack':
    path    => '/bin:/usr/bin',
    unless  => "/usr/bin/apt-key list | /bin/grep -q '${saltstack_key}'",
    command => "apt-key adv --keyserver 'keyserver.ubuntu.com' --recv-keys '${saltstack_key}'",
    before  => File[ 'saltstack-salt.list' ],
  }

  file { 'saltstack-salt.list':
    ensure  => present,
    path    => "/etc/apt/sources.list.d/saltstack-salt-${lsbdistcodename}.list",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('mirrors/saltstack-salt.list.erb'),
  }

  exec { 'apt_update':
    command     => '/usr/bin/apt-get update',
    subscribe   => File[ 'saltstack-salt.list' ],
    refreshonly => true,
  }

}
