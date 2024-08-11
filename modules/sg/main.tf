resource "aws_security_group" "dev_SG" {
  name        = "dev_SG"
  description = "Allow HTTP, SSH inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "dev_SG"
    Purpose = "SG for dev_vpc"
  }
}

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
  security_group_id = aws_security_group.dev_SG.id
  cidr_ipv4         = var.vpc_cidr
  from_port         = 8080
  to_port           = 8080
  ip_protocol       = "tcp"

  tags = {
    Name    = "Allow HTTP Request"
    Purpose = "To Cannect to the ec2 instance"
  }
}

resource "aws_vpc_security_group_ingress_rule" "SSH" {
  security_group_id = aws_security_group.dev_SG.id
  cidr_ipv4         = var.vpc_cidr
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"

  tags = {
    Name    = "Allow SSH Request"
    Purpose = "To Cannect to the ec2 instance"
  }
}
resource "aws_vpc_security_group_egress_rule" "dev_egress_SG" {
  security_group_id = aws_security_group.dev_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
