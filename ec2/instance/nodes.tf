data "template_file" "userdata" {
  count    = "${var.node_count}"
  template = "${file("./userdata.tpl")}"

  vars {
    name = "${format("node-%02d", count.index + 1)}"
  }
}

variable "cidr" {
  default = "172.1.1.0/24"
}

variable "bias" {
  description = "IP baias"
  default     = 100
}

resource "aws_instance" "node" {
  count                  = "${var.node_count}"
  ami                    = "${module.amazonlinux.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.internal.id}", "${aws_security_group.egress.id}"]
  user_data              = "${data.template_file.userdata.*.rendered[count.index]}"
  private_ip             = "${cidrhost("${var.cidr}", count.index + 1 + 100)}"

  tags {
    Name = "${format("node-%02d", count.index + 1)}"
  }
}
