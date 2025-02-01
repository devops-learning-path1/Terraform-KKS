module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  availability_zone = var.availability_zone
  cluster_name = var.cluster_name
}