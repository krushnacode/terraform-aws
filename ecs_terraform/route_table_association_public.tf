resource "aws_route_table_association" "public_ecs__a" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public_ecs__a.id
}

resource "aws_route_table_association" "public_ecs__b" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public_ecs__b.id
}