variable "name" {
  description = "SCP name"
  type        = string
}

variable "targets" {
  description = "Lits of OU and account id's to attach SCP"
  type        = set(string)
  default     = []
}


# SCP rule toggles

variable "deny_root_account_access" {
  description = "Deny usage of AWS account root"
  default     = false
  type        = bool
}

variable "deny_password_policy_changes" {
  description = "Deny changes to the IAM password policy"
  default     = false
  type        = bool
}

variable "deny_vpn_gateway_changes" {
  description = "Deny changes to VPN gateways"
  default     = false
  type        = bool
}

variable "deny_vpc_changes" {
  description = "Deny VPC related changes"
  default     = false
  type        = bool
}

variable "deny_config_changes" {
  description = "Deny AWS Config related changes"
  default     = false
  type        = bool
}

variable "deny_cloudtrail_changes" {
  description = "Deny AWS CloudTrail related changes"
  default     = false
  type        = bool
}
