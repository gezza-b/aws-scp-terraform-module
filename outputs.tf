# Generated collection of SCP statements
output "scp_document" {
  description = "Generated SCP document"
  value       = data.aws_iam_policy_document.scp_policy.json
}
