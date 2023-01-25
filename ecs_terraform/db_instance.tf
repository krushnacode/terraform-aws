resource "aws_db_instance" "default" {
  
  backup_window = "03:00-04:00"
  
  ca_cert_identifier = "rds-ca-2019" # or any other certificate
  
  db_subnet_group_name = "db-subnet-group"
  
  engine_version = "13.4"
  
  engine = "postgers"
  
  final_snapshot_identifier = "final_snapshot"
  
  identifier = "production"
  
  instance_class = "db.t3.micro"
  
  maintenance_window = "sun:08:00-sun:09:00"
  
  name = "blog_production"
  
  parameter_group_name = "default.postgres13"
  
  password = "YOUR-MASTER-PASSWORD"
  
  username = "postgres"
}