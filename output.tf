output "aws_security_group_http_server_info" {
  value = aws_security_group.http_server_sg
}

output "aws_instance_http_server" {
  value = aws_instance.http_server
}

output "http_server_public_dns" {
  value = aws_instance.http_server.public_dns
}

output "aws_default_vpc_id" {
  value = aws_default_vpc.default.id
}

output "aws_default_subnet_ids" {
  value = data.aws_subnet_ids.default_subnets
}