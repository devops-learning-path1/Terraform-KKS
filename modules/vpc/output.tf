output "vpc_id" {
    description = "The id of the VPC"
    value = aws_vpc.eksvpc.id
  
}
output "public_subnets" {
    description = "List of the public ids"
    value = aws_subnet.ekspublicsubnet[*].id
  
}
output "private_subnets" {
    description = "List of the private ids"
    value = aws_subnet.eksprivatesubnet[*].id
  
}