output "keyname" {
  value = "${module.keypair.name}"
}

output "security_group_ids" {
  value = "${module.vpc.security_group_ids}"
}

output "subnet_id" {
  value = "${module.vpc.subnet_id}"
}

output "region" {
  value = "${var.region}"
}
