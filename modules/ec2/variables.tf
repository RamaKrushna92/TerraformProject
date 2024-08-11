variable "SG_ID" {
  description = "Security Group ID for dev_Ec2 instance"
  type        = string
}

variable "subnets" {
  description = "subnets ids for dev_Ec2 instance"
  type        = list(string)
}

variable "ec2_names" {
  description = "Ec2 Instance Names"
  type        = list(string)
  default     = ["dev_ec2_instance-1", "dev_ec2_instance-2"]
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "jenkins-key.pem"
}