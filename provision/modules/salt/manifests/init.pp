# == Class: salt
#
# This class installs and manages the Salt Minion daemon.
#
# === Parameters
#
# === Actions
#
# - Install salt-minion package
# - Ensure salt-minion daemon is running
#
# === Requires
#
# === Sample Usage
#
#   class { 'salt': }
#
class salt {

  package { 'salt-minion':
    ensure => latest,
  }

  service { 'salt-minion':
    enable  => true,
    ensure  => running,
    require => Package[ 'salt-minion' ],
  }

}
