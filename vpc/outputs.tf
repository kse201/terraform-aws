output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.main.id}"
}

output "security_group_ids" {
  value = [
    "${aws_security_group.ssh.id}",
    "${aws_security_group.egress.id}",
  ]
}
