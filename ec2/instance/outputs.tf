output "id" {
  description = "Instance ID"
  value       = "${aws_instance.bastion.id}"
}

output "bastion_public_dns" {
  description = "Public DNS name for Bastion"
  value       = "${aws_instance.bastion.public_dns}"
}

output "bastion_public_ip" {
  description = "Public IP address for Bastion"
  value       = "${aws_instance.bastion.public_ip}"
}
