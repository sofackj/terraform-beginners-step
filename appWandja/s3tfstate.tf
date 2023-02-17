terraform {
 backend "s3" {
 bucket = "nuumfactory-terraform-backend"
 key = "terraform-15.tfstate"
 region = "eu-west-3"
 }
}
