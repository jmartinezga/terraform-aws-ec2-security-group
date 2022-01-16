# Common variables
region      = "eu-west-1"
application = "helloworld"
environment = "dev"

# Module variables
sg_name               = "ec2-sg"
sg_description        = "EC2 Security Group"
vpc_id                = "vpc-0dcef6ce0aed94c3e"
sg_ingress_rules_cidr = {}
sg_ingress_rules_source_sg = {
  "sg_alb" = {
    from_port                = 8000,
    to_port                  = 8000,
    protocol                 = "tcp",
    source_security_group_id = "sg-0f9b6027906ee01af",
    description              = "application from ALB"
  }
}
