module "vpc" {
  source = "./modules/vpc"
}
module "alb" {
  source = "./modules/alb"
}

resource "aws_autoscaling_group" "example" {
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = module.vpc.aws_subnets_default_ids

  target_group_arns = [module.alb.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 4

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
