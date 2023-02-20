provider "aws" {
 region = "eu-west-3"
 profile = "default"
}
terraform {
 backend "s3" {
 bucket = "nuumfactory-terraform-backend"
 key = "terraform-${var.digit}.tfstate"
 region = "eu-west-3"
 }
}
locals {
  elb_sg_name = "nuumfactory-${var.environment}-lb-sg-${var.digit}"
  ec2_sg_name = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  db_sg_name  = "nuumfactory-${var.environment}-db-sg-${var.digit}"
}
