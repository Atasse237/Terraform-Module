variable "public_subnet_az1_Id" {}
variable "public_subnet_az2_Id" {}
variable "aws_internet_gateway" {}
variable "vpc_Id" {}
variable "private_app_subnet_az1_Id" {}
variable "private_app_subnet_az2_Id" {}
variable "private_database_subnet_az1_Id" {}
variable "private_database_subnet_az2_Id" {}
variable "eip_ip_1" {
    default = "eipalloc-0661c4768a95865a5"
}
variable "eip_ip_2" {
    default = "eipalloc-01e84c593520a17e7"
}