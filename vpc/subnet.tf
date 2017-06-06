resource "aws_subnet" "main" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidr_block}"
  map_public_ip_on_launch = true

  tags {
    Name = "main"
  }
}
