output "consul_server_details" {
    value = <<EOT
 
    Private IP : ${aws_instance.consul[0].private_ip}  
    $ ssh -i ${aws_instance.consul[0].key_name}.pem ubuntu@${aws_instance.consul[0].public_ip}

    Start Consul in Dev mode via CLI: 
    
    consul agent -dev -client=0.0.0.0 -bind=${aws_instance.consul[0].private_ip} -hcl 'disable_remote_exec=false'

    EOT
}

output "consul_client_details" {
    value = <<EOT
 
    Private IP : ${aws_instance.consul[1].private_ip} 
    $ ssh -i ${aws_instance.consul[1].key_name}.pem ubuntu@${aws_instance.consul[1].public_ip}

    Join Consul Server in Dev Mode via CLI:

    consul agent -join ${aws_instance.consul[0].private_ip} -bind ${aws_instance.consul[1].private_ip} --data-dir /home/ubuntu/consul -hcl 'disable_remote_exec=false'

    EOT
}