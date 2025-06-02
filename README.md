# Terraform CI/CD Pipeline with Cloud Conformity Security Scanning

A complete CI/CD pipeline implementation that integrates Terraform infrastructure-as-code with Cloud Conformity security scanning, using AWS CodePipeline, CodeBuild, and GitHub.

## 🏗️ Architecture Overview

![Architecture Diagram](./architecture-diagram.png)

This architecture illustrates the flow from code commit to infrastructure deployment and security scanning.

## 🚀 Features

- **Automated CI/CD Pipeline**: Triggered on GitHub commits
- **Terraform Infrastructure Management**: Validate, plan, and deploy infrastructure
- **Security Scanning**: Real-time Cloud Conformity integration
- **Secure Credential Management**: AWS Parameter Store for API keys
- **Build Artifacts**: S3 storage with encryption and versioning
- **IAM Security**: Least-privilege access policies

## 📋 Prerequisites

- AWS Account with appropriate permissions
- Terraform >= 1.0
- GitHub repository
- Cloud Conformity account and API key
- AWS CLI configured

## 📁 Project Structure

```
.
├── architecture-diagram.png
├── README.md
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── .github
    └── workflows
        └── terraform-cicd-pipeline.yml
```

- **`architecture-diagram.png`**: Overview of the system architecture
- **`README.md`**: This documentation file
- **`terraform/`**: Directory containing Terraform configuration files
- **`.github/workflows/`**: GitHub Actions workflows for CI/CD

## 🛠️ Infrastructure Code
