# Terraform EC2 Security Group module

### Install dependencies

<!-- markdownlint-disable no-inline-html -->

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs)
* [`terragrunt`](https://terragrunt.gruntwork.io/docs/getting-started/install/)
* [`terrascan`](https://github.com/accurics/terrascan)
* [`TFLint`](https://github.com/terraform-linters/tflint)
* [`TFSec`](https://github.com/liamg/tfsec)
* [`infracost`](https://github.com/infracost/infracost)
* [`jq`](https://github.com/stedolan/jq)

### Install the pre-commit hook globally

```bash
DIR=~/.git-template
git config --global init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_source_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | (Required) Application name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Environment (dev, stg, prd) | `string` | n/a | yes |
| <a name="input_internet_access"></a> [internet\_access](#input\_internet\_access) | (Optional) Internet access | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | (Required) AWS Region | `string` | n/a | yes |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | (Required) Security Group description | `string` | n/a | yes |
| <a name="input_sg_ingress_rules_cidr"></a> [sg\_ingress\_rules\_cidr](#input\_sg\_ingress\_rules\_cidr) | (Optional) Ingress rules (CIDR) | <pre>map(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>    description = string<br>  }))</pre> | `{}` | no |
| <a name="input_sg_ingress_rules_source_sg"></a> [sg\_ingress\_rules\_source\_sg](#input\_sg\_ingress\_rules\_source\_sg) | (Optional) Ingress rules (Source SG) | <pre>map(object({<br>    from_port                = number<br>    to_port                  = number<br>    protocol                 = string<br>    source_security_group_id = string<br>    description              = string<br>  }))</pre> | `{}` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | (Required) Security Group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) List of policies arn | `any` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Required) VPC Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_arn"></a> [sg\_arn](#output\_sg\_arn) | Security Group ARN. |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | Security Group Id. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
