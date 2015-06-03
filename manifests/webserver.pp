# Main Webserver Profile
#
class profiles::webserver (
  $port = hiera('webport')
){

# Call Nginx
  class { 'nginx': }

  # Add the Nginx vhost for our test site
  nginx::resource::vhost { 'www.pltest.com':
    www_root    => '/var/www/www.pltest.com',
    listen_port => "${port}",
    require     => File['/var/www/www.pltest.com'],
    notify      => Vcsrepo['/var/www/www.pltest.com'],
  }

  # Make sure the parent webroot exists
  file {'/var/www':
    ensure => 'directory',
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }

# Make sure the docroot exists
  file {'/var/www/www.pltest.com':
    ensure => 'directory',
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }


  # Refresh the data on every run
  vcsrepo {'/var/www/www.pltest.com':
    ensure   => 'latest',
    provider => 'git',
    source   => 'https://github.com/puppetlabs/exercise-webpage.git',
    revision => 'development',
    require  => File['/var/www/www.pltest.com'],
  }
}
