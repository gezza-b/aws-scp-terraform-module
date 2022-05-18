locals {

  deny_root_account_access_statement     = var.deny_root_account_access ? [""] : []
  deny_password_policy_changes_statement = var.deny_password_policy_changes ? [""] : []
  deny_vpn_gateway_changes_statement     = var.deny_vpn_gateway_changes ? [""] : []
  deny_vpc_changes_statement             = var.deny_vpc_changes ? [""] : []
  deny_config_changes_statement          = var.deny_config_changes ? [""] : []
  deny_cloudtrail_changes_statement      = var.deny_cloudtrail_changes ? [""] : []

}
