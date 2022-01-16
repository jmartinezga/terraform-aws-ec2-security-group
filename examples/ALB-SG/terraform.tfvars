# Common variables
region      = "eu-west-1"
application = "helloworld"
environment = "dev"

# Module variables
# Module variables
sg_name        = "alb-sg"
sg_description = "ALB Security Group"
vpc_id         = "vpc-0dcef6ce0aed94c3e"
sg_ingress_rules_cidr = {
  "http" = {
    from_port   = 80,
    to_port     = 80,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"],
    description = "http from Internet"
  }
}
sg_ingress_rules_source_sg = {}
