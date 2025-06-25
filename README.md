# Infrastructure as Code (IaC) project using Terraform

This project demonstrates how to provision AWS infrastructure using Terraform. It includes multiple modules and configuration files to define and deploy infrastructure as code (IaC) on AWS.

## Features

### 1. VPC Networking (`aws-vpc-networking/`)
- Provisions a custom Virtual Private Cloud (VPC) with subnets, route tables, and networking components.

### 2. EC2 Instance Deployment (`ec2-terraform/`)
- Deploys an AWS EC2 instance with configurable parameters and provider settings.

### 3. Highly Available Web Application (`highly-available-webapp/`)
- Sets up a highly available web application architecture including:
  - Application Load Balancer (ALB)
  - Auto-scaled EC2 instances
  - RDS database
  - Custom VPC and networking
  - Output variables for integration

### 4. Static Website Hosting (`static-website-s3-cloudfront/`)
- Deploys a static website using Amazon S3 and CloudFront for global content delivery.
- Includes sample website files (`index.html`, `error.html`).

## Getting Started

Each folder contains its own `README.md` and Terraform configuration files. Refer to the respective folder for detailed setup and usage instructions.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html)
- AWS account and credentials

## Usage
1. Navigate to the desired feature folder.
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review and apply the configuration:
   ```bash
   terraform plan
   terraform apply
   ```

