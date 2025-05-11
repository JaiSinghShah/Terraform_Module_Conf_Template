terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region           # Defined in variables.tf or CLI input
  profile = var.aws_profile      # Optional; can be hardcoded or passed via Jenkins env
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "compute" {
  source         = "./modules/compute"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.bucket_name
}
