user { 'eshamow':
  ensure => present,
  managehome => true,
}
file { ['/proj','/proj/eshamow']:
  ensure => directory,
}
vcsrepo { '/proj/eshamow/dotfiles':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/eshamow/dotfiles',
}
file { '/home/eshamow/.vimrc':
  ensure  => link,
  target  => '/proj/eshamow/dotfiles/vimrc',
  require => Vcsrepo['/proj/eshamow/dotfiles'],
}
file { '/home/eshamow/.vim':
  ensure  => link,
  target  => '/proj/eshamow/dotfiles/vim',
  require => Vcsrepo['/proj/eshamow/dotfiles'],
}
exec { 'install_docker':
  command => 'wget -qO- https://get.docker.com/ | sh',
}
