terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "nuumfactory-terraform-backend"
    key = "terraform-15.tfstate"
    region = "eu-west-3"
    }
}

provider "aws" {
 region = "eu-west-3"
 access_key = var.access_key
 secret_key = var.secret_key
}

