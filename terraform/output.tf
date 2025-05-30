
output "codepipeline_name" {
  description = "Name of the CodePipeline"
  value       = aws_codepipeline.terraform_pipeline.name
}

output "codebuild_project_name" {
  description = "Name of the CodeBuild project"
  value       = aws_codebuild_project.terraform_build.name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for artifacts"
  value       = aws_s3_bucket.pipeline_artifacts.bucket
}

output "github_webhook_url" {
  description = "GitHub webhook URL"
  value       = aws_codepipeline_webhook.github_webhook.url
}