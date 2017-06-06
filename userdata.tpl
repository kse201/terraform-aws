#cloud-config

preserve_hostname: false
hostname: ${name}
fqdn: ${name}.example.com
manage_etc_hosts: true

repo_update: true
repo_upgrade: all

locale: jp_JP.UTF-8
timezone: Asia/Tokyo

runcmd:
  - sudo yum update -y
