resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH"

  vpc_id = "${var.vpc_id}"

  tags {
    Name = "Allow SSH"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.global_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${var.global_ip}/32"]
  }
}
