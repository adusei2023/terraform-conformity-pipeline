#!/bin/bash

set -e

echo "Setting up Terraform Conformity Pipeline..."

# Set variables
PROJECT_NAME="terraform-conformity-demo"
AWS_REGION="us-east-1"
CONFORMITY_API_KEY="your-conformity-api-key-here"

# Deploy infrastructure
echo "Deploying pipeline infrastructure..."
cd terraform/
terraform init
terraform plan -var="conformity_api_key=$CONFORMITY_API_KEY"
terraform apply -var="conformity_api_key=$CONFORMITY_API_KEY" -auto-approve

# Get outputs
REPO_URL=$(terraform output -raw codecommit_repository_clone_url)
PIPELINE_NAME=$(terraform output -raw codepipeline_name)

echo "Infrastructure deployed successfully!"
echo "Repository URL: $REPO_URL"
echo "Pipeline Name: $PIPELINE_NAME"

# Clone repository and push initial code
echo "Setting up repository..."
cd ..
git clone $REPO_URL repo-local
cd repo-local

# Copy files
cp -r ../terraform ./
cp -r ../pipeline ./
cp -r ../scripts ./

# Add test infrastructure
cat > terraform/test-infrastructure.tf << 'EOF'
# Sample infrastructure with security issues for testing
resource "aws_instance" "test_instance" {
  ami           = "ami-0c55b159cbfafe1d0"
  instance_type = "t2.micro"
  
  tags = {
    Name = "test-instance"
  }
}
EOF

# Commit and push
git add .
git commit -m "Initial commit with Terraform code and Conformity scanner setup"
git push origin main

echo "Setup complete! Your pipeline will now run automatically."
echo "Check AWS CodePipeline console for execution status."