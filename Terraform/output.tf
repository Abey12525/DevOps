output "centos_server_public_public_ip" {
    value = aws_instance.centos_server.public_ip
}

output "centos_server_public_private_ip" {
    value = aws_instance.centos_server.private_ip
}

output "centos_server_id" {
    value = aws_instance.centos_server.id
}