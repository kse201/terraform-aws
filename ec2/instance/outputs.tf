output "id" {
  description = "Instance ID"
  value       = "${aws_instance.instance.id}"
}

output "public_dns" {
  description = "Public DNS name"
  value       = "${aws_instance.instance.public_dns}"
}

output "public_ip" {
  description = "Public IP address"
  value       = "${aws_instance.instance.public_ip}"
}
