# Allocate Elastic IP az1. 

resource "aws_eip" "eip_ip_1" {
  vpc      = true

  tags = {
  name = "eip_ip_1"
}

}


# Allocate Elastic IP az2. 

resource "aws_eip" "eip_ip_2" {
  vpc      = true

  tags = {
  name = "eip_ip_2"
}

}

# create nat gateway in public subnet 1


resource "aws_nat_gateway" "nat-gateway-public-subnet-1" {
  allocation_id = var.eip_ip_1
  subnet_id     = var.public_subnet_az1_Id
  # vpc_Id = var.vpc_Id

  tags = {
    Name = "nat-gateway-public-subnet-1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.aws_internet_gateway]
}


resource "aws_nat_gateway" "nat-gateway-public-subnet-2" {
  allocation_id = var.eip_ip_2
  subnet_id     = var.public_subnet_az2_Id

  tags = {
    Name = "nat gateway in public subnet 2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.aws_internet_gateway]
}

# create  private route table and add route through nategaway az1


resource "aws_route_table" "private-app-route-table-az1" {
  vpc_id = var.vpc_Id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-public-subnet-2.id
  }


  tags = {
    Name = "private-app-route-table-az1"
  }
}


# create  private route table and add route through nategaway az2


resource "aws_route_table" "private-app-route-table-az2" {
  vpc_id = var.vpc_Id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-public-subnet-2.id
  }


  tags = {
    Name = "private-app-route-table-az2"
  }
}

# Resource: aws_route_table_association az1

resource "aws_route_table_association" "aws_route_table_association_az1" {
  subnet_id      = var.private_app_subnet_az1_Id
  route_table_id = aws_route_table.private-app-route-table-az1.id
}

# Resource: aws_route_table_association az2

resource "aws_route_table_association" "aws_route_table_association_az2" {
  subnet_id      = var.private_app_subnet_az2_Id
  route_table_id = aws_route_table.private-app-route-table-az2.id
}


# Resource: aws_route_table_association database az1

resource "aws_route_table_association" "aws_route_table_association-database_az1" {
  subnet_id      = var.private_database_subnet_az1_Id
  route_table_id = aws_route_table.private-app-route-table-az1.id
}

# Resource: aws_route_table_association database az2

resource "aws_route_table_association" "aws_route_table_association-database_az2" {
  subnet_id      = var.private_database_subnet_az2_Id
  route_table_id = aws_route_table.private-app-route-table-az2.id
}