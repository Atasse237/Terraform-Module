# cofigure aws provider

provider "aws" {
  region    = var.region
  profile   = "terraform_user"
}

# create VPC

module "vpc" {
  source                               = "../modules/vpc"
  region                               = var.region
  project_modules                      = var.project_modules
  vpc_cidr                             = var.vpc_cidr
  public_subnet_az1_cidr               = var.public_subnet_az1_cidr
  public_subnet_az2_cidr               = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr          = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr          = var.private_app_subnet_az2_cidr
  private_database_subnet_az1_cidr     = var.private_database_subnet_az1_cidr
  private_database_subnet_az2_cidr     = var.private_database_subnet_az2_cidr

  
}