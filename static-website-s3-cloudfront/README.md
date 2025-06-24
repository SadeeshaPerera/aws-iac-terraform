# Static Website on AWS S3 with CloudFront (Singapore Region)

This Terraform configuration deploys a static website to an S3 bucket and serves it via CloudFront in the Singapore region (`ap-southeast-1`).

## Structure
- `website/index.html` and `website/error.html`: Sample static website files.
- `main.tf`: Terraform resources for S3, CloudFront, and permissions.
- `providers.tf`: Provider and Terraform version requirements.

## Usage
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Apply the configuration:
   ```bash
   terraform apply
   ```
3. After apply, Terraform will output the S3 bucket name and CloudFront domain name.

## Notes
- The S3 bucket name is randomized to avoid conflicts.
- CloudFront uses the default SSL certificate for HTTPS.
- The website is public via CloudFront.
