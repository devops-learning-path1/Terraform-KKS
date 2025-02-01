variable "aws_region" {
    description = "The AWS region to deploy resources"
    type = string
    default = "us-east-1"
  
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type = string
  
}

variable "cluster_name" {
    description = "Cluster name"
    type = string
  
}
variable "private_subnets" {
    description = "private_subnets"
    type = list(string)  
  
}
variable "availability_zone" {
    description = "List of availability zone"
    type = list(string)
  
}
variable "public_subnets" {
    description = "public_subnets"
    type = list(string)  
  
}