variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "keypair name"
}

variable "vpc_id" {
  description = "vpc id"
}

variable "subnet_id" {
  description = "subnet id"
}

variable "global_ip" {
  description = "Global IP"
}

variable "node_count" {
  default = 1
}
