resource "aws_ecr_repository" "default" {
  name = "ecr_terraform_practice"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value = aws_ecr_repository.default.repository_url
}