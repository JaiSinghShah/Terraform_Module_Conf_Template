resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-module-conf-template"  # Ensure it's lowercase

  # No need to specify ACL here if not required by AWS
  # Removed: acl argument, AWS manages the access control automatically.

  tags = {
    Name        = "terraform-module-conf-template"
    Environment = "Dev"
  }
}

# Optionally, if you need specific permissions, you can add an S3 bucket policy here.
