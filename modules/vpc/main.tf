resource "aws_vpc" "eksvpc" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = "${var.cluster_name}-vpc"
    }
  
}
resource "aws_subnet" "eksprivatesubnet" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.eksvpc.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = var.availability_zone[count.index]

    tags = {
      Name = "${var.cluster_name}-private-subnet-${count.index}"
    }
  
}
resource "aws_subnet" "ekspublicsubnet" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.eksvpc.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = var.availability_zone[count.index]

    tags = {
      Name = "${var.cluster_name}-public-subnet-${count.index}"
    }
}    
resource "aws_internet_gateway" "eksinternetgateway" {
    vpc_id = aws_vpc.eksvpc.id

    tags = {
      Name = "${var.cluster_name}-igw"

    }
}
resource "aws_route_table" "eksroute_table" {
    vpc_id = aws_vpc.eksvpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eksinternetgateway.id
    }
  tags = {
    Name = "${var.cluster_name}-public-rt"
  }
}
resource "aws_route_table_association" "rt_association_public" {
    count = length(var.public_subnets)
    subnet_id = aws_subnet.ekspublicsubnet[count.index].id
    route_table_id = aws_route_table.eksroute_table.id
  
}