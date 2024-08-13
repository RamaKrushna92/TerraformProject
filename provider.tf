terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "5.60.0"
    }
  }
  backend "s3" {
    bucket = "terraform-project-vpc"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  # Configuration options
  region     = "us-east-1"
}
<<<<<<< HEAD
=======

>>>>>>> 15b56976d2693f931a4abcee88fb2ce6e8054435
