terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0" # Minimum Terraform version
}

provider "aws" {
    region = var.aws_region
  
}