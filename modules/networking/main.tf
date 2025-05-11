resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  region = "ap-south-1"  # Specify the region
  tags = {
    Name = "Main_VPC"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"  # Availability Zone in the ap-south-1 region
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet"
  }
}
