#https://www.terraform.io/language/values/outputs
output "sg_id" {
  description = "Security Group Id."
  value       = aws_security_group.this.id
}

output "sg_arn" {
  description = "Security Group ARN."
  value       = aws_security_group.this.arn
}
