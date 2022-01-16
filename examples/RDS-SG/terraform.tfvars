# Common variables
region      = "eu-west-1"
application = "helloworld"
environment = "dev"

# Module variables
sg_name        = "postgres-sg"
sg_description = "RDS Security Group"
vpc_id         = "vpc-0dcef6ce0aed94c3e"
sg_ingress_rules_cidr = {
  "sg_rds" = {
    from_port   = 5432,
    to_port     = 5432,
    protocol    = "tcp",
    cidr_blocks = ["10.0.1.0/24", "10.0.3.0/24"],
    description = "ec2 from private subnets"
  }
}
sg_ingress_rules_source_sg = {}
