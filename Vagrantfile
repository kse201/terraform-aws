# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

terraform = JSON.parse(File.read('./terraform_output.json'))
terraform.each { |k, v| terraform[k] = v['value'] }
userdata = File.read('./userdata')

VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ssh_username = 'ec2-user'
  region = terraform['region']
  ami = 'ami-5de0433c' # terraform['ami']['amazonlinux'] # FIXME
  instance_type = 't2.micro'
  keyname = terraform['keyname']

  config.vm.box = 'dummy'
  config.vm.box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'

  config.vm.provider :aws do |aws, override|
    aws.aws_dir = ENV['HOME'] + '/.aws/'
    aws.aws_profile = 'default'
    aws.keypair_name              = keyname
    override.ssh.username         = ssh_username
    override.ssh.private_key_path = "#{ENV['HOME']}/.ssh/id_rsa_ec2"
    # aws.private_ip_address = ''

    aws.region = region
    aws.elastic_ip = false
    aws.subnet_id = terraform['subnet_id']
    aws.security_groups = terraform['security_groups']

    aws.tags = { 'Name' => 'ec2.vagrant' }
    aws.ami = ami
    aws.instance_type = instance_type
    aws.user_data = userdata

    # config.ssh.proxy_command = '' # FIXME
    # config.ssh.forward_agent
    # config.ssh.forward_env
    # config.ssh.keep_alive
  end
end
