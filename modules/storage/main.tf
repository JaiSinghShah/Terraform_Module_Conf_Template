resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-module-conf-template"  # ✅ compliant name

  tags = {
    Name        = "TerraformModuleConfTemplate"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
