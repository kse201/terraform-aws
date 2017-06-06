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
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${var.global_ip}/32"]
  }
}

resource "aws_security_group" "internal" {
  name        = "internal"
  description = "Allow all packet in internal"

  vpc_id = "${var.vpc_id}"

  tags {
    Name = "internal"
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }
}
