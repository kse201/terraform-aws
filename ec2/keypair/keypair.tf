variable "name" {
  description = "default keypair"
  default     = "default-key"
}

variable "public_key" {
  description = "public_key for default keypair"
}

resource "aws_key_pair" "default" {
  key_name   = "${var.name}"
  public_key = "${var.public_key}"
}

output "name" {
  value       = "${aws_key_pair.default.key_name}"
  description = "Keypair name"
}
