locals {
  elb_sg_name = "nuumfactory-${var.environment}-lb-sg-${var.digit}"
  ec2_sg_name = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  db_sg_name  = "nuumfactory-${var.environment}-db-sg-${var.digit}"
  test = {
        "instance1" = {"type" = "t2.micro","az" = "a","public_ip" = true}
        "instance2" = {"type" = "t2.small","az" = "b","public_ip" = true}
        "instance3" = {"type" = "t2.medium","az" = "c","public_ip" = true}
        "instance4" = {"type" = "t2.large","az" = "a","public_ip" = false}
        "instance5" = {"type" = "t2.xlarge","az" = "b","public_ip" = false}
    }
}
