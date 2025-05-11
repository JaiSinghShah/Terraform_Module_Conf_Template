
module "networking" {
  source     = "./modules/networking"
  vpc_cidr   = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "compute" {
  source     = "./modules/compute"
  ami_id     = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  subnet_id  = module.networking.subnet_id
}

module "storage" {
  source     = "./modules/storage"
  bucket_name = "Terraform_Module_Conf_Template"
}
    