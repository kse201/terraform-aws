#cloud-config

hostname: "${name}"
repo_update: true
repo_upgrade: all

locale: jp_JP.UTF-8
timezone: Asia/Tokyo
preserve_hostname: true

runcmd:
  - sudo yum update -y
