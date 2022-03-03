output "consul_server" {
  value = <<EOT
 
    Private IP : ${aws_instance.consul_server.private_ip}  
    $ ssh -i ${aws_instance.consul_server.key_name}.pem ubuntu@${aws_instance.consul_server.public_ip}

    EOT
}

output "consul_client" {
  value = <<EOT
 
    Consul Client 1 :
    ------------------ 
        
        Private IP : ${aws_instance.consul_client[0].private_ip}
        SSH Login  : ssh -i ${aws_instance.consul_client[0].key_name}.pem ubuntu@${aws_instance.consul_client[0].public_ip}

    Consul Client 2 :
    ------------------ 
        
        Private IP : ${aws_instance.consul_client[1].private_ip}
        SSH Login  : ssh -i ${aws_instance.consul_client[1].key_name}.pem ubuntu@${aws_instance.consul_client[1].public_ip}

    EOT
}