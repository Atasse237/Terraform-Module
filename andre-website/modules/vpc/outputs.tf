output "region" {
  value = var.region

}

output "project_modules" {
  value = var.project_modules
  
}

output "vpc_id" {
  value = aws_vpc.VPC.id
  
}


output "public_subnet_az1_Id" {
  value = aws_subnet.public_subnet_az1.id
  
}

output "public_subnet_az2_Id" {
  value = aws_subnet.public_subnet_az2.id
  
}


output "private_app_subnet_az1_Id" {
  value = aws_subnet.private-subnet-app-az1.id
  
}

output "private_app_subnet_az2_Id" {
  value = aws_subnet.private-subnet-app-az2.id
  
}

output "private_database_subnet_az1_Id" {
  value = aws_subnet.private-subnet-database-az1.id
  
}


output "private_database_subnet_az2_Id" {
  value = aws_subnet.private-subnet-database-az2.id
  
}


output "aws_internet_gateway" {
  value = aws_internet_gateway.igw
  
}

# output "eip_ip_1_Id" {
#   value = aws_eip.ip_1.id

# }

# output "eip_ip_2_Id" {
#   value = aws_eip.ip_2.id
  
# }




