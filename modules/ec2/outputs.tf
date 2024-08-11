output "dev_instaces" {
  value = aws_instance.dev.*.id
}

