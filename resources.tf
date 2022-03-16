// first create an HTTP server: 80 TCP, 22 TCP, CIDR ["0.0.0.0/0"]
// then create a security group with the above config

// meant to replace the default vpc
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  // vpc_id = "vpc-075343a660b9eb15c"
  // using the default value
  vpc_id = aws_default_vpc.default.id

  // IN -> ingress: where to allow traffic from
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  // IN -> ingress for ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  // OUT -> egress: what can you do from this server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}

// create a virtual server
resource "aws_instance" "http_server" {
  // ami                    = "ami-033b95fb8079dc481"
  // from data.aws_ami
  count                  = 2
  ami                    = data.aws_ami.latest_aws_linux_2.id
  key_name               = var.ec2_key
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  // get this from vpc on aws
  subnet_id = tolist(data.aws_subnet_ids.default_subnets.ids)[3]
}