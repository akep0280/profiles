# Audit Status
class profiles::audit {
  # Hiera Lookups
  $installed = hiera('audit_installed')

  include profiles::base
  include audit
}
