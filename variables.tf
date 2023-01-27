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
# Define tags
variable "tag_name" {
  type    = string
  default = "julien"
}
# Id of the AMI
variable "ami_id" {
  description = "standard free ec2 instance"
  default = "ami-005835d578c62050d"
}
# Sensitives values
variable "access_key" {

}

variable "secret_key" {

}