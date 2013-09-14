#
# Clone a git repo
#
define deployer::git (
  $source,
  $target,
  $user   = 'root',
  $ensure = $::deployer::ensure
  ) {

  require 'deployer::packages'
  require 'deployer::privatekey'

  if $ensure == present {
    exec { "git-clone-${name}":
      user    => $user,
      command => "/usr/bin/git clone ${source} ${target}",
      creates => $target,
    }
  } else {
    file {$target:
      ensure => absent,
      force  => true,
    }
  }
}
