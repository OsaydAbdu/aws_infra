terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "osayd_io" {
  ami                         = "ami-0fc20dd1da406780b"
  instance_type               = "t3a.nano"
  availability_zone           = "us-east-2a"
  ebs_optimized               = true
  disable_api_termination     = true
  security_groups             = [aws_security_group.osaydio.id]
  associate_public_ip_address = true
  key_name                    = "osayd.io"
  monitoring                  = false
  tags                        = {
    Name = "osayd.io"
  }
  vpc_security_group_ids      = ["sg-0a481d9561be8db9c",]
  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 4
    volume_type           = "gp2"
  }

  ebs_block_device {
    delete_on_termination = false
    device_name           = "/dev/sda2"
    encrypted             = true
    volume_size           = 8
    volume_type           = "gp2"
  }

}

