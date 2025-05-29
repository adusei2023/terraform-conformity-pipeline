#!/bin/bash

set -e

# Variables - UPDATE THESE
GITHUB_OWNER="your-github-username"
GITHUB_REPO="terraform-conformity-pipeline"
GITHUB_TOKEN="your-github-token-here"

echo "Setting up GitHub repository..."

# Create repository structure
mkdir -p terraform pipeline scripts

# Create sample terraform.tfvars file
cat > terraform.tfvars << EOF
# Update these values for your environment
conformity_api_key = "your-conformity-api-key"
github_owner = "$GITHUB_OWNER"
github_repo = "$GITHUB_REPO"
github_token = "$GITHUB_TOKEN"
github_webhook_secret = "your-secure-webhook-secret"
EOF

# Add test infrastructure with security issues
cat > terraform/test-infrastructure.tf << 'EOF'
# Sample infrastructure with security issues for testing
resource "aws_instance" "test_instance" {
  ami           = "ami-0c55b159cbfafe1d0"
  instance_type = "t2.micro"
  
  # Security issue: No security group specified
  # Security issue: Instance in default VPC
  
  tags = {
    Name = "test-instance"
  }
}

# Security issue: S3 bucket without encryption
resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-test-bucket-${random_string.bucket_suffix.result}"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}
EOF

# Initialize git repository
git init
git add .
git commit -m "Initial commit - Terraform Conformity Pipeline setup"

# Add GitHub remote and push
git remote add origin https://github.com/$GITHUB_OWNER/$GITHUB_REPO.git
git branch -M main
git push -u origin main

echo "GitHub repository setup complete!"
echo "Repository: https://github.com/$GITHUB_OWNER/$GITHUB_REPO"