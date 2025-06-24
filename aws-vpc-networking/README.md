# AWS VPC Networking Terraform Example (Singapore Region)

This Terraform configuration provisions a basic AWS VPC network in the Singapore region (`ap-southeast-1`) with:

- A VPC (`10.0.0.0/16`)
- 2 public subnets (in different AZs)
- 2 private subnets (in different AZs)
- An Internet Gateway for public subnets
- Route tables for public and private subnets
- A NAT Gateway for outbound internet access from private subnets

## Files
- `main.tf`: Main Terraform configuration for all resources

## Usage
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Review the plan:
   ```bash
   terraform plan
   ```
3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Outputs
- `vpc_id`: The ID of the created VPC
- `public_subnet_ids`: List of public subnet IDs
- `private_subnet_ids`: List of private subnet IDs
- `internet_gateway_id`: The ID of the Internet Gateway
- `nat_gateway_id`: The ID of the NAT Gateway

## Notes
- Subnets are distributed across two availability zones for high availability.
- NAT Gateway is created in the first public subnet for private subnet internet access.
- All resources are tagged for easy identification.
