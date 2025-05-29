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
