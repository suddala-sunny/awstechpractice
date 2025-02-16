module "aws-ec2" {
  source            = "./aws-ec2"
  vpc_id            = module.aws-vpc.vpc_id
  security_group_id = module.aws-sg.security_group_id
  public_subnet_id  = module.aws-vpc.public_subnet_id
}

module "aws-vpc" {
  source = "./aws-vpc"
  vpc_id = module.aws-vpc.vpc_id
}

module "aws-sg" {
  source = "./aws-sg"
  vpc_id = module.aws-vpc.vpc_id
}