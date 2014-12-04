# Not Audited
class profiles::audit_dev {
  include profiles::base

  package { 'audit':
    ensure => absent,
  }
}
