variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ami_id" {
  description = "AMI ID to launch the EC2 instance"
  type        = string
  default     = "ami-0e35ddab05955cf57"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "Terraform_Module_Conf_Template"
}
