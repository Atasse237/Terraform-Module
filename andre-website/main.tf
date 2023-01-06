# cofigure aws provider

provider "aws" {
  region  = var.region
  profile = "terraform_user"
}

# create VPC

module "vpc" {
  source                           = "../andre-website/modules/vpc"
  region                           = var.region
  project_modules                  = var.project_modules
  vpc_cidr                         = var.vpc_cidr
  public_subnet_az1_cidr           = var.public_subnet_az1_cidr
  public_subnet_az2_cidr           = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr      = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr      = var.private_app_subnet_az2_cidr
  private_database_subnet_az1_cidr = var.private_database_subnet_az1_cidr
  private_database_subnet_az2_cidr = var.private_database_subnet_az2_cidr


}


# create nat gateway
module "nat_gateway" {
  source               = "../andre-website/modules/nat-gateway"
  public_subnet_az1_Id = module.vpc.public_subnet_az1_Id
  public_subnet_az2_Id = module.vpc.public_subnet_az2_Id
  aws_internet_gateway = module.vpc.aws_internet_gateway
  # aws_eip                        = module.vpc.nat_gateway
  vpc_Id                         = module.vpc.vpc_id
  private_app_subnet_az1_Id      = module.vpc.private_app_subnet_az1_Id
  private_app_subnet_az2_Id      = module.vpc.private_app_subnet_az2_Id
  private_database_subnet_az1_Id = module.vpc.private_database_subnet_az1_Id
  private_database_subnet_az2_Id = module.vpc.private_database_subnet_az2_Id

}