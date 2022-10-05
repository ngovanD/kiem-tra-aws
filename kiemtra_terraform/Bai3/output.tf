module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source = "./modules/alb"
}

output "subnet_cidr_blocks" {
  value = [for s in module.vpc.aws_subnet_default : s.cidr_block]
}

output "alb_dns_name" {
  value       = module.alb.aws_lb_example_dns_name
  description = "The domain name of the load balancer"
}