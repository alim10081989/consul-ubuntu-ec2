resource "aws_instance" "consul" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count         = 2
  key_name      = "AWS"
  vpc_security_group_ids = [ "sg-0f9c3281b55a4d38f" ]

  tags = {
    Name = "consul-${count.index}"
  }

  user_data = data.template_file.consul.rendered
}

data "template_file" "consul" {
  template = file("templates/consul_install.tpl")
}