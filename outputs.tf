#https://www.terraform.io/language/values/outputs
output "id" {
  description = "Security Group Id."
  value       = aws_security_group.this.id
}

output "arn" {
  description = "Security Group ARN."
  value       = aws_security_group.this.arn
}
