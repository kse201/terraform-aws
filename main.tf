variable "global_ip" {
  description = "Global IP"
}

module "keypair" {
  source = "./ec2/keypair"

  public_key = "${file("./id_rsa_ec2.pub")}"
}

module "ec2" {
  source = "./ec2/instance"

  key_name   = "${module.keypair.name}"
  vpc_id     = "${module.vpc.id}"
  subnet_id  = "${module.vpc.subnet_id}"
  global_ip  = "${var.global_ip}"
  cidr       = "172.1.1.0/24"
  node_count = 0
}

module "vpc" {
  source = "./vpc"

  name       = "develop"
  cidr_block = "172.1.1.0/24"
}

terraform {
  backend "s3" {
    bucket = "kse201"
    key    = "terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

output "bastion_dns" {
  value = "${module.ec2.bastion_public_dns}"
}
