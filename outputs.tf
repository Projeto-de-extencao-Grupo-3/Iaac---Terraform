output "frontend_1_public_ip" {
  value = aws_instance.frontend_1.public_ip
}

output "frontend_2_public_ip" {
  value = aws_instance.frontend_2.public_ip
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}

output "db_private_ip" {
  value = aws_instance.db.private_ip
}