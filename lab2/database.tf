resource "aws_db_instance" "db" {
  allocated_storage    = 10
  db_name              = "nuumfactory-${var.environment}-db-${var.digit}"
  db_subnet_group_name = "nuumfactory-db-subnet-group"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "dbadmin"
  password             = "dbadminpassword"
  skip_final_snapshot  = false
  vpc_security_group_ids = [
    aws_security_group.sgprivdb.id
  ]
}