resource "aws_instance" "ec2" {
    for_each = {
        "instance1" = {"type" = "t2.micro","az" = "a","public_ip" = true}
        "instance2" = {"type" = "t2.small","az" = "b","public_ip" = true}
        "instance3" = {"type" = "t2.medium","az" = "c","public_ip" = true}
        "instance4" = {"type" = "t2.large","az" = "a","public_ip" = false}
        "instance5" = {"type" = "t2.xlarge","az" = "b","public_ip" = false}
    }

    ami = "ami-0f15e0a4c8d3ee5fe"
    associate_public_ip_address = each.value.public_ip
    instance_type = "${each.value.type}"
    availability_zone = "eu-west-3${each.value.az}"

    tags = {
         Name = "nuumfactory-ec2-for-each-15"
    }
}