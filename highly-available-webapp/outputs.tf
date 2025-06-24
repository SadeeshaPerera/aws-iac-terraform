output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.webapp.dns_name
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.webapp.endpoint
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances (if any)"
  value = [for i in aws_autoscaling_group.webapp.instances : i.public_ip if i.public_ip != null]
}
