resource "aws_instance "ec2" {
    for_each = {
        "instance1" = {
            "type" = "t2.micro",
            "az" = "a",
            "public_ip" = true
        }
        "instance2" = {
            "type" = "t2.small",
            "az" = "b",
            "public_ip" = true
        }
        "instance3" = {
            "type" = "t2.medium",
            "az" = "c",
            "public_ip" = true
        }
        "instance4" = {
            "type" = "t2.large",
            "az" = "a",
            "public_ip" = false
        }
        "instance5" = {
            "type" = "t2.xlarge",
            "az" = "b",
            "public_ip" = false
        }
    }
    ami = "ami-0f15e0a4c8d3ee5fe"
    associate_public_ip_address = each.value.public_ip
    instance_type = "${each.value.type}"
    availability_zone = "eu-west-3${each.value.az}"
    tags = {
         Name = "nuumfactory-ec2-for-each-15"
    }
}

# resource "aws_security_group" "sgpublb" {
#   name =  "nuumfactory-sg-replace-triggered-by-15"
#   description = "La description de votre choix"

#   ingress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "nuumfactory-sg-replace-triggered-by-15"
#   }
  
# }

# resource "aws_s3_bucket" "bucket" {
#   bucket = "nuumfactory-sg-replace-triggered-by-15"
#   tags = {
#      harry-potter-house = "helloworld"
#   }
#   lifecycle {
#     replace_triggered_by = [
#       aws_security_group.sgpublb.id
#     ]
#   }
# }

# resource "aws_s3_bucket" "bucket" {
#   bucket = " nuumfactory-s3-ignorechanges-15"
#   tags = {
#      harry-potter-house = "helloworld"
#   }
# }

# resource "aws_security_group" "sgpublb" {
#   name =  "nuumfactory-sg-create-before-destroy-15"
#   description = "La description de votre choix"

#   ingress {
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "nuumfactory-create-before-destroy-15"
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_s3_bucket" "bucket" {
#   count = 5
#   bucket = "nuumfactory-s3-count-15-${count.index}"
#   tags = {
#     count-index = "${count.index}"
#   }
# }
# resource "aws_s3_bucket_versioning" "versioning_example" {
#   count = 5
#   bucket = aws_s3_bucket.bucket[count.index].id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_instance" "instance_1" {
#   ami = "ami-00575c0cbc20caf50"
#   instance_type = "t2.micro"
# }
# resource "aws_instance" "instance_2" {
#   ami = "ami-0e742cca61fb65051"
#   instance_type = "t2.micro"
#   provider = aws.asia
# }
# resource "aws_instance" "instance_3" {
#   ami = "ami-0bb935e4614c12d86"
#   instance_type = "t2.micro"
#   provider = aws.nordic
# }
# resource "aws_instance" "instance_4" {
#   ami = "ami-0dfcb1ef8550277af"
#   instance_type = "t2.micro"
#   provider = aws.united
# }
