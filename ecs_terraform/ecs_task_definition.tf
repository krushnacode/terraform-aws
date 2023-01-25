resource "aws_ecs_task_definition" "default" {
  container_definitions = file("container_definitions.json")
  family = "container"
  memory = 812
  network_mode = "host"
  requires_compatibilities = ["EC2"]
}
