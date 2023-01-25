resource "aws_alb" "default" {
  name = "alb"
  security_groups = [aws_security_group.alb.id]

  subnets = [
    aws_subnet.public_ecs__a.id,
    aws_subnet.public_ecs__b.id
  ]
}