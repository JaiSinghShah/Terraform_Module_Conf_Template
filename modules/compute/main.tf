resource "aws_instance" "app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.networking.subnet_id
  region        = "ap-south-1"  # Specify the region here
  tags = {
    Name = "App Instance"
  }
}
