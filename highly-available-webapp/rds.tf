# RDS, Subnet Group, and Security Group
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL from EC2 SG"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "webapp" {
  name       = "webapp-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id
  tags = { Name = "webapp-db-subnet-group" }
}

resource "aws_db_instance" "webapp" {
  identifier              = "webapp-db"
  engine                  = "mysql"
  instance_class          = var.rds_instance_class
  allocated_storage       = 20
  db_subnet_group_name    = aws_db_subnet_group.webapp.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  username                = var.db_username
  password                = var.db_password
  multi_az                = true
  skip_final_snapshot     = true
  publicly_accessible     = false
  storage_encrypted       = true
  backup_retention_period = 7
  deletion_protection     = false
}
