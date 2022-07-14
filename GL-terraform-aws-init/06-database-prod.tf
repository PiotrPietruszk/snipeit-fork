resource "aws_db_instance" "snipe-it-db" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7.21"
  instance_class         = "db.t3.micro"
  db_name                = "snipeitdb"
  username               = "snipeit"
  password               = "44234423"
  storage_type           = "gp2"
  port                   = "3306"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.network-security-group.id]
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group-prod.name

  tags = {
    Name = "snpeitdb"
  }
}