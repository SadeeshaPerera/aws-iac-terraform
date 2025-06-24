output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.webapp.dns_name
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.webapp.endpoint
}

data "aws_autoscaling_group" "webapp" {
  name = aws_autoscaling_group.webapp.name
}

# Fetch public IPs for each instance in the ASG
data "aws_instance" "webapp" {
  for_each = toset(data.aws_autoscaling_group.webapp.instances)
  instance_id = each.value
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances (if any)"
  value = [for i in data.aws_instance.webapp : i.value.public_ip if i.value.public_ip != null]
}
