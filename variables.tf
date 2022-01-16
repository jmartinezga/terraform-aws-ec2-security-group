#https://www.terraform.io/language/values/variables
###############################################################################
# Required variables
###############################################################################
variable "sg_name" {
  description = "(Required) Security Group name"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.sg_name) > 0
    error_message = "Security Group name is required."
  }
}

variable "sg_description" {
  description = "(Required) Security Group description"
  type        = string
  nullable    = false

  validation {
    condition     = length(var.sg_description) > 0
    error_message = "Security Group description is required."
  }
}

variable "vpc_id" {
  description = "(Required) VPC Id"
  type        = string
  nullable    = false

  validation {
    condition     = can(regex("^vpc-([a-z0-9]){17}", var.vpc_id))
    error_message = "You must put a valid VPC Id (ex: vpc-0dcef6ce0aed94c3e)."
  }
}

###############################################################################
# Optional variables
###############################################################################
variable "sg_ingress_rules_cidr" {
  description = "(Optional) Ingress rules (CIDR)"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = {}
}

variable "sg_ingress_rules_source_sg" {
  description = "(Optional) Ingress rules (Source SG)"
  type = map(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    source_security_group_id = string
    description              = string
  }))
  default = {}
}

variable "internet_access" {
  description = "(Optional) Internet access"
  type        = bool
  default     = true
}

variable "tags" {
  description = "(Optional) List of policies arn"
  type        = any
  default     = {}
}
