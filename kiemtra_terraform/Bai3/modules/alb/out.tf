output "arn" {
  value = aws_lb_target_group.asg.arn
}

output "dns_name" {
  value = aws_lb.example.dns_name
}