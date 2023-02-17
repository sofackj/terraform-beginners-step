provider "aws" {
 region = "eu-west-3"
 profile = "default"
 access_key = var.access_key
 secret_key = var.secret_key
}

terraform {
 backend "s3" {
 bucket = "nuumfactory-terraform-backend"
 key = "terraform-15.tfstate"
 region = "eu-west-3"
 }
}
