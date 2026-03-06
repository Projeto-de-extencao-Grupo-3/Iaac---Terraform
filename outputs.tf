output "frontend_1_public_ip" {
  value = aws_instance.frontend_grotrack.public_ip
}

output "frontend_2_public_ip" {
  value = aws_instance.frontend2_grotrack.public_ip
}

output "backend_private_ip" {
  value = aws_instance.backend_grotrack.private_ip
}

output "db_private_ip" {
  value = aws_instance.db_grotrack.private_ip
}

output "api_private_ip" {
  value = aws_instance.api_grotrack.private_ip
}