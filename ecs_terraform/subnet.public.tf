resource "aws_subnet" "public_ecs__a" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = "public-ap-south-1a"

  tags = {
    "Env" = "production"
    "Name" = "public-ap-south-1a"
  }
  vpc_id = aws_vpc.default.id
}

resource "aws_subnet" "public_ecs__b" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "public-ap-south-1b"
  

  tags = {
    "Env" = "production"
    "Name" = "public-ap-south-1b"
  }
  vpc_id = aws_vpc.default.id
}