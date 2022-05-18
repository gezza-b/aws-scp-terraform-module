#
# Creating SCPs for the Production environment
#
module "scp-prod" {
  source  = "../"
  targets = toset([var.ou_targets.production])
  name    = "production"

  deny_root_account_access     = true
  deny_password_policy_changes = true
  deny_vpn_gateway_changes     = true
  deny_vpc_changes             = true
  deny_config_changes          = true
  deny_cloudtrail_changes      = true
}

#
# Creating SCPs for the Development environment
#
module "scp-dev" {
  source  = "../"
  targets = toset([var.ou_targets.development])
  name    = "development"

  deny_root_account_access     = true
  deny_password_policy_changes = true
  deny_config_changes          = true
  deny_cloudtrail_changes      = true
}
