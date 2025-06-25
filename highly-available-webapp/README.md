# Highly Available Web Application on AWS (Terraform)

This Terraform configuration deploys a highly available web application on AWS with the following architecture:

## Architecture Overview
- **VPC** with public and private subnets across 2 Availability Zones
- **Internet Gateway** for public subnets
- **NAT Gateway** for private subnets
- **Application Load Balancer (ALB)** in public subnets
- **Auto Scaling Group (ASG)** of EC2 instances in private subnets
- **Amazon RDS (MySQL)** in private subnets with Multi-AZ
- **Security Groups** for ALB, EC2, and RDS

## Features
- Highly available and fault-tolerant
- Web servers automatically scale based on CPU utilization
- Secure networking with public/private subnets and security groups
- Outputs for ALB DNS, RDS endpoint, and EC2 instance IDs

## File Structure
- `vpc.tf` – VPC, subnets, IGW, NAT, and route tables
- `alb.tf` – ALB, target group, listener, and ALB security group
- `ec2.tf` – Launch template, ASG, EC2 security group, scaling policies, and user data
- `rds.tf` – RDS instance, subnet group, and RDS security group
- `variables.tf` – Input variables
- `outputs.tf` – Outputs for ALB DNS, RDS endpoint, and EC2 instance IDs
- `user_data.sh` – Script to install Apache and serve a simple index.html

## Usage
1. **Configure AWS Credentials**
   - Ensure your AWS CLI is configured or set environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_DEFAULT_REGION`).

2. **Initialize Terraform**
   ```sh
   terraform init
   ```

3. **Review and Set Variables**
   - Edit `variables.tf` or use `-var` flags to set values such as `ami_id`, `db_username`, and `db_password`.

4. **Plan the Deployment**
   ```sh
   terraform plan
   ```

5. **Apply the Configuration**
   ```sh
   terraform apply
   ```

6. **Outputs**
   - After apply, Terraform will output:
     - ALB DNS name
     - RDS endpoint
     - EC2 instance IDs

## Notes
- **AMI ID**: Use a valid Linux AMI for your region (e.g., Amazon Linux 2).
- **Public IPs**: EC2 public IPs are not directly available for ASG-managed instances in private subnets. Use the AWS Console or CLI to retrieve them if needed.
- **Cleanup**: To destroy all resources, run:
   ```sh
   terraform destroy
   ```

## License
MIT
