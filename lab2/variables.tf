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
variable "key_file_path" {
  type = string
}