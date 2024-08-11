# VPC

resource "aws_vpc" "dev_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name    = "dev_vpc"
    Purpose = "To add to dev_instcnce"
  }
}

# 2 Subnets
resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidr)
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_cidr[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

# Internet Gatway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev_vpc InternetGateway"
  }
}
# Route Table
resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name    = "dev_rt"
    Purpose = "To add dev_instance"
  }
}
# Route Table Association
resource "aws_route_table_association" "dev_rt_as" {
  count          = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.dev_rt.id
}