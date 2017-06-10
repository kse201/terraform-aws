variable "global_ip" {
  description = "Global IP"
}

module "keypair" {
  source = "./ec2/keypair"

  public_key = "${file("./id_rsa_ec2.pub")}"
}

module "ami" {
  source = "./ami"
}

module "vpc" {
  source = "./vpc"

  name       = "develop"
  cidr_block = "172.1.1.0/24"
  global_ip  = "${var.global_ip}"
}

terraform {
  backend "s3" {
    bucket = "kse201"
    key    = "terraform/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
