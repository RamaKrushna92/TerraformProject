output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.subnets.*.id
}

# output "subnet_cidr" {
#   value = aws_subnet.subnets.id

# }