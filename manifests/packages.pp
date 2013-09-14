#
# install packages
#
class deployer::packages () {
  package { 'git': ensure => $::deployer::ensure }
}
