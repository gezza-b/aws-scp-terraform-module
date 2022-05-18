# SCP targets - i.e. the OUs in our AWS Organization
variable "ou_targets" {
  type = map(any)
  default = {
    "development" = "ou-enen-abcd1234",
    "test"        = "ou-enen-abcd1235",
    "production"  = "ou-enen-abcd1236"
  }
}

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}
