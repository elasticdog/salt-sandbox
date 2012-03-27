# == Class: mirrors::yum
#
# This class installs the Fedora People Salt YUM repository.
#
# === Parameters
#
# === Actions
#
# - Install fedorapeople salt repository
# - Perform initial sync to update package database
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors::yum': }
#
class mirrors::yum {

  file { 'epel-salt.repo':
    ensure  => present,
    path    => '/etc/yum.repos.d/epel-salt.repo',
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/mirrors/epel-salt.repo',
  }

  exec { 'yum_makecache':
    command     => '/usr/bin/yum makecache',
    subscribe   => File[ 'epel-salt.repo' ],
    refreshonly => true,
  }

}
