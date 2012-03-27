#
# site.pp - defines defaults for vagrant provisioning
#

# use run stages for minor vagrant environment fixes
stage { 'pre': before => Stage['main'] }

class { 'mirrors':    stage => 'pre' }
class { 'networking': stage => 'pre' }
class { 'vagrant':    stage => 'pre' }

class { 'salt': }

if $hostname == 'salt' {
  class { 'salt::server': }
}
