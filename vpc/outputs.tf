output "subnet_id" {
  description = "ID from Subnet"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "ID from SG"
  value       = aws_security_group.security_group.id
}
output "aws_route53_zone_id" {
  description = "ID from Route53 Zone"
  value       = aws_route53_zone.route53.zone_id
}