output "dev_instances" {
  value = aws_instance.dev.*.id
}

output "instance_public_ip" {
  value = aws_instance.dev[*].public_ip
}


