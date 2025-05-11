
variable "ami_id" {
  description = "AMI ID for the instance"
  default     = "ami-0e35ddab05955cf57"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID"
}
    