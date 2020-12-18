
resource "aws_security_group" "osaydio" {
  name        = "website"
  description = "allow ssh, http, and https"
  vpc_id      = "vpc-fbb1d392"

  ingress {
    protocol    = "tcp"
    from_port   = 3998
    to_port     = 3998
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description = "For ssh"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "osayd.io"
  }
}

resource "aws_eip" "osaydio_eip" {
  instance = aws_instance.osayd_io.id
  vpc      = true
  tags     = {
    Name = "osayd.io"
  }
}
