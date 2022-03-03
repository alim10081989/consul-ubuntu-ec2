variable "aws_region" { default = "ap-south-1" }
variable "client_count" { default = 2 }
variable "keypair" { default = "" }

variable "client_name" {
  default = {
    "0" = "consul-client-1"
    "1" = "consul-client-2"
  }
}