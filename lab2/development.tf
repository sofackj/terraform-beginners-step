# Test variables
# Define systems
variable "elb_subnets" {
  type = list(string)  
}
variable "ec2_subnet" {
  type = string  
}
variable "ec2_type" {
  type = string
}
variable "digit" {
  type = string  
}
variable "vpc" {
  type = string  
}
variable "environment" {
  type = string  
}
# igw id
variable "igw_id" {
  type = string
  default = "igw-061c7808c74a9a3a1"
}
# Id of the AMI
variable "ami_id" {
  description = "standard free ec2 instance"
  # Ubuntu server
  default = "ami-05b457b541faec0ca"
}
