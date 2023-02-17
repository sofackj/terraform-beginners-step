terraform {
 backend "s3" {
 bucket = "nuumfactory-terraform-backend"
 key = "terraform-kata.tfstate"
 region = "eu-west-3"
 }
}
