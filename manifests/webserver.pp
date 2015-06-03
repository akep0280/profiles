# Main Webserver Profile
#
class profiles::webserver (
  $port = hiera('webport')
){
  class { 'nginx': }

  nginx::resource::vhost { 'www.pltest.com':
    www_root    => '/var/www/www.pltest.com',
    listen_port => "${port}",
  }
}
