variable "ami_id" {
  description = "AMI ID to launch the EC2 instance"
  type        = string
  default     = "ami-0e35ddab05955cf57"  # Make sure this AMI is available in ap-south-1 region
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}
