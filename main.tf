variable "global_ip" {
  description = "Global IP"
}

module "keypair" {
  source = "./ec2/keypair"

  public_key = "${file("./id_rsa_ec2.pub")}"
}

module "instance" {
  source    = "./ec2/instance"
  key_name  = "${module.keypair.name}"
  name      = ""
  vpc_id    = "${module.vpc.id}"
  subnet_id = "${module.vpc.subnet_id}"
  global_ip = "${var.global_ip}"
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

output "instance_id" {
  value = "${module.instance.id}"
}

output "public_dns" {
  value = "${module.instance.public_dns}"
}
