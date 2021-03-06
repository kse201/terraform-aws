resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH"

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "Allow SSH"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.global_ip}/32"]
  }
}

resource "aws_security_group" "internal" {
  name        = "internal"
  description = "Allow all packet in internal"

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "Internal"
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

resource "aws_security_group" "egress" {
  name        = "allow_egress"
  description = "Allow all egress packet"

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "Allow egress"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
