module "VPC" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "dev_SG" {
  source   = "./modules/sg"
  vpc_id   = module.VPC.vpc_id
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source   = "./modules/ec2"
  SG_ID    = module.dev_SG.dev_SG
  subnets  = module.VPC.subnet_ids
  key_name = "jenkins-key"
}

