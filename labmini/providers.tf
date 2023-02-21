terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
 region = "eu-west-3"
 profile = "default"
}
# provider "aws" {
#   alias = "united"
#   region = "us-east-1"
# }
# provider "aws" {
#   alias = "nordic"
#   region = "eu-north-1"
# }
# provider "aws" {
#   alias = "asia"
#   region = "ap-south-1"
# }


