# Test variables
# Define systems
variable "my_first_loop" {
  type = map(any)
  default = {
    subnet_one = {
      sub_cidr = "13.57.140.0/24"
    }
    subnet_two = {
      sub_cidr = "13.57.141.0/24"
    }
  }
}
variable "vpc_id" {
  type = string
  default = "vpc-06b654aaaf2422e1f"
}
# Define tags
variable "tag_name" {
  type    = string
  default = "julien"
}
# Id of the AMI
variable "ami_id" {
  description = "standard free ec2 instance"
  # Ubuntu server
  default = "ami-05b457b541faec0ca"
}