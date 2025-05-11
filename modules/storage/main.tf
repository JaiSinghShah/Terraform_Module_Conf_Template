resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"
  region = "ap-south-1"  # Specify the region

  tags = {
    Name = "Terraform Module Bucket"
  }
}
