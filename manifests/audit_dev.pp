# Not Audited
class profiles::notaudited {
  include profiles::base

  package { 'audit':
    ensure => absent,
  }
}
