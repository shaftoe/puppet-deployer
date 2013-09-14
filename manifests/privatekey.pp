#
# Install root ssh key
#
class deployer::privatekey (
  $content = false,
  $ensure = $::deployer::ensure
  ) {

  if ! $content { fail 'No ssh key provided'}

  $dir = $ensure ? {
    present => directory,
    default => absent
  }
  file { '/root/.ssh':
    ensure => $dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/root/.ssh/config':
    ensure  => $ensure,
    owner   => 'root',
    mode    => '0400',
    content => 'StrictHostKeyChecking=no'
  }

  file {'/root/.ssh/id_rsa':
    ensure  => $ensure,
    owner   => 'root',
    mode    => '0400',
    content => $content,
  }

}
