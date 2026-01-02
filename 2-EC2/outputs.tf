output "aws_instance" {
  description = "ID from Instance"
  value       = aws_instance.vm[*].id
}
output "instance_public_ips" {
  value = aws_instance.vm[*].public_ip
}