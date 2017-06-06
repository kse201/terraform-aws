resource "aws_instance" "bastion" {
  ami                         = "${module.amazonlinux.id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = ["${aws_security_group.ssh.id}", "${aws_security_group.internal.id}"]
  monitoring                  = true
  associate_public_ip_address = true

  tags {
    Name = "bastion"
  }
}
