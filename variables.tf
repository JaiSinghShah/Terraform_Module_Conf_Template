variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = ap-south-1"  # Or set via CLI/Jenkins input
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"  # Optional, use only if you use AWS profiles
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}
