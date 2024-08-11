resource "aws_instance" "dev" {
  count                       = length(var.ec2_names)
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.SG_ID]
  subnet_id                   = var.subnets[count.index]
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  key_name                    = var.key_name


  tags = {
    Name = var.ec2_names[count.index]
  }

  # Provisining scripts can be added here using user_data
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y java
    sudo yum install -y wget
    sudo wget -O /etc/yum.repos.d/jenkins.repo \ 
    sudo wget https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade
    sudo yum install jenkins
    sudo systemctl daemon-reload
  EOF

}