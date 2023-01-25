resource "aws_security_group" "db_instance" {
    description = "db-instance-security-group"

    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "db_instance"
      from_port = 0
      to_port = 0
    } ]

    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 5432
      to_port = 5432
    } ]

    name = "db-instance-security-group"

    tags = {
      "Env" = "prodcution"
      "Name" = "security-group-db"
    }

    vpc_id = aws_vpc.default.id

}