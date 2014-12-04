# Not Audited
class profiles::notaudited {
  include profiles::base

  package { ['audit','audit-libs']:
    ensure => absent,
  }
}
