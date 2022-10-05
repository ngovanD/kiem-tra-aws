module "vpc" {
  source = "./modules/vpc"
}

resource "aws_lb" "example" {
  name               = "terraform-asg-example"
  load_balancer_type = "application"
  subnets            = module.vpc.aws_subnets_default_ids

  security_groups    = [aws_security_group.alb.id]
}