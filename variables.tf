variable "aws_region" {
  default = "us-east-1"
}

// private key variable
variable "aws_key_pair" {
  default = "~/aws/aws_keys/friday-0211.pem"
}

variable "ec2_key" {
  default = "friday-0211"
}

variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_connection_type" {
  default = "ssh"
}

variable "ec2_user" {
  default = "ec2-user"
}

variable "cidr" {
  default = ["0.0.0.0/0"]
}