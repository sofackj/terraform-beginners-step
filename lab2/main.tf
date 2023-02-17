provider "aws" {
 region = "eu-west-3"
 profile = "default"
}
terraform {
 backend "s3" {
 bucket = "nuumfactory-terraform-backend"
 key = "terraform-15.tfstate"
 region = "eu-west-3"
 }
}
