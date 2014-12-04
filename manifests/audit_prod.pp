# Audited
class profiles::audit_prod {
  # Hiera Lookups
  $installed = hiera('audit_installed')

  include profiles::base
  include audit
}
