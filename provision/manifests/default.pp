#
# site.pp - defines defaults for vagrant provisioning
#

# use run stages to control overall module load order
stage { 'pre': before => Stage['main'] }

class { 'mirrors':    stage => 'pre' }
class { 'networking': stage => 'pre' }
class { 'vagrant':    stage => 'pre' }

class { 'salt': }

if $hostname == 'salt' {
  class { 'salt::server': }
}
