module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "compute" {
  source      = "./modules/compute"
  ami_id      = var.ami_id
  instance_type = var.instance_type
}

module "storage" {
  source     = "./modules/storage"
  bucket_name = var.bucket_name
}
