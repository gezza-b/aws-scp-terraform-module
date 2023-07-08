# AWS SCP Module for Terraform

The module generates a AWS SCP document and individual policy statements can be added by toggling the according variables to true.
This module includes only a handful of statements for demo purposes.
However, it can be easily extended for production needs.

Included statements are:

* Deny usage of AWS root account
* Deny changing the IAM password policy
* Deny changes to VPCs
* Deny changes of AWS Config resources
* Deny changes of AWS CloudTrail resources

## Why I find this module useful

The module makes it easier to manage AWS SCP (service control policy) rules at a large scale. 
SCPs have a size limitation of SCPs, which is 5,120 bytes per SCP. 
The approach provides a smart way to enable and disable rules for individually generated SCPs.
Because modules can be versioned, managing several versions in different environments is also easy.
For example, you can test the latest version in a Development or Test environment but have your Production environment on a lower minor release version. 

## Example for a Service Contol Policy

This example enables all deny statements:

```hcl
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
```

## Blog Post

https://medium.com/@bachlmayr/efficient-implementation-of-aws-service-control-policies-with-terraform-25d41a3d81ca



<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_policy.scp_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) | resource |
| [aws_organizations_policy_attachment.scp_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment) | resource |
| [aws_iam_policy_document.scp_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deny_cloudtrail_changes"></a> [deny\_cloudtrail\_changes](#input\_deny\_cloudtrail\_changes) | Deny AWS CloudTrail related changes | `bool` | `false` | no |
| <a name="input_deny_config_changes"></a> [deny\_config\_changes](#input\_deny\_config\_changes) | Deny AWS Config related changes | `bool` | `false` | no |
| <a name="input_deny_password_policy_changes"></a> [deny\_password\_policy\_changes](#input\_deny\_password\_policy\_changes) | Deny changes to the IAM password policy | `bool` | `false` | no |
| <a name="input_deny_root_account_access"></a> [deny\_root\_account\_access](#input\_deny\_root\_account\_access) | Deny usage of AWS account root | `bool` | `false` | no |
| <a name="input_deny_vpc_changes"></a> [deny\_vpc\_changes](#input\_deny\_vpc\_changes) | Deny VPC related changes | `bool` | `false` | no |
| <a name="input_deny_vpn_gateway_changes"></a> [deny\_vpn\_gateway\_changes](#input\_deny\_vpn\_gateway\_changes) | Deny changes to VPN gateways | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | SCP name | `string` | n/a | yes |
| <a name="input_targets"></a> [targets](#input\_targets) | Lits of OU and account id's to attach SCP | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_scp_document"></a> [scp\_document](#output\_scp\_document) | Generated SCP document |
<!-- END_TF_DOCS -->
