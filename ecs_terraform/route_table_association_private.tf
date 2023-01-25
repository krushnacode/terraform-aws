resource "aws_route_table_association" "private_ecs_a" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private_ecs_a.id
}

resource "aws_route_table_association" "private_ecs_b" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private_ecs_b.id

}
