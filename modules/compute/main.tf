module "networking" {
  source = "../networking"
}

resource "aws_instance" "app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.networking.subnet_id
}
