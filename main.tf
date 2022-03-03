resource "aws_instance" "consul_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "AWS"
  vpc_security_group_ids = ["sg-0f9c3281b55a4d38f"]

  tags = {
    Name = "consul-server"
  }

  user_data = data.template_file.consul_server.rendered
}


data "template_file" "consul_server" {
  template = file("templates/consul_server/consul_install.tpl")
}

resource "aws_instance" "consul_client" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "AWS"
  count                  = 2
  vpc_security_group_ids = ["sg-0f9c3281b55a4d38f"]

  tags = {
    Name = "consul-client-${count.index + 1}"
  }

  user_data = data.template_file.consul_client.rendered
}


data "template_file" "consul_client" {
  template = file("templates/consul_client/consul_install.tpl")
  vars = {
    tpl_server_private_ip = aws_instance.consul_server.private_ip
  }
}