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
bind_addr = "$(hostname -i)"
client_addr = "0.0.0.0"
node_name = "consul-server"
bootstrap_expect = 1
ui_config { enabled = true }
server = true
disable_remote_exec = false
EOF

cat << EOF > /etc/consul.d/agent.hcl
acl = {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
}
EOF

## Manage Permissions & Start Consul
sudo chown -R consul:consul /etc/consul.d
sudo systemctl start consul