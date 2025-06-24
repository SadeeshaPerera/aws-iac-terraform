output "ec2_instance_ids" {
  description = "Instance IDs of EC2 instances in the ASG"
  value       = aws_autoscaling_group.webapp.*.id
}

# To get public IPs, use AWS CLI or console, or consider using a custom script or external data source.
