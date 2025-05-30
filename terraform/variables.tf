variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "terraform-conformity-demo-v2"
}

variable "conformity_api_key" {
  description = "Conformity API key for scanning"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_webhook_secret" {
  description = "Secret for GitHub webhook"
  type        = string
  sensitive   = true
}

variable "github_branch" {
  description = "GitHub branch to monitor"
  type        = string
  default     = "main"
}

variable "conformity_region" {
  description = "Conformity region"
  type        = string
  default     = "us-east-1"
}