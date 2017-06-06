module "amazonlinux" {
  source = "../../ami/amazonlinux"
}

resource "aws_instance" "instance" {
  ami                    = "${module.amazonlinux.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.ssh.id}"]

  tags {
    Name = "${var.name}"
  }
}
