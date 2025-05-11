resource "aws_s3_bucket" "bucket" {
  bucket = "Terraform_Module_Conf_Template"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.bucket
  acl    = "private"
}
