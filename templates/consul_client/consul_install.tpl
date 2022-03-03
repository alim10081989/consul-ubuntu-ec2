#!/usr/bin/env bash

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install consul

## Consul Data Directory
sudo mkdir /home/ubuntu/consul
sudo chown -R consul:consul /home/ubuntu/consul

## Consul Configuration File
cat << EOF > /etc/consul.d/consul.hcl
data_dir = "/home/ubuntu/consul"
start_join = [ "${tpl_server_private_ip}" ]
bind_addr = "$(hostname -i)"
enable_local_script_checks = true
disable_remote_exec = false
node_name = "consul-client"
EOF

## Manage Permissions & Start Consul
sudo chown -R consul:consul /etc/consul.d
sudo systemctl start consul