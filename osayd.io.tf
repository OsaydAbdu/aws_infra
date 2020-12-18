#resource "aws_key_pair" "instance_key" {
#  key_name   = "instances-key"
#  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGN/LF5nxZlz9JnV4V7KmsFIuKqU6vURh6xl5nBmj0ju osaydabdu@gmail.com"
#}

resource "aws_instance" "osayd_io" {
  ami                         = "ami-0fc20dd1da406780b"
  instance_type               = "t3a.nano"
  availability_zone           = "us-east-2a"
  ebs_optimized               = true
  disable_api_termination     = true
  security_groups             = [aws_security_group.osaydio.name]
  associate_public_ip_address = true
  key_name                    = "osayd.io"
  monitoring                  = false
  tags                        = {
    Name = "osayd.io"
  }
  vpc_security_group_ids      = ["sg-0a481d9561be8db9c",]
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 8
    volume_type           = "gp2"
  }

# ebs_block_device {
#    delete_on_termination = false
#    device_name           = "/dev/sda2"
#    encrypted             = true
#    volume_size           = 8
#    volume_type           = "gp2"
#  }

}

