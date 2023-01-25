resource "aws_db_subenet_group" "default" {
  name = "db-subnet-group"

  subnet = [
    aws_subnet.private_ecs_a.id,
    aws_subnet.private_ecs_b.id
  ]

  tags = {
    Env = "production"
    Name = "db-subnet-group"
  }
}