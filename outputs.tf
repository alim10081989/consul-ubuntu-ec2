output "public_ip" {
    value = [for instance in aws_instance.consul : instance.public_ip]
}