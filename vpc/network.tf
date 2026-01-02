resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags       = var.default_tags
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags       = var.default_tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags       = var.default_tags
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  tags       = var.default_tags
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name        = "security_group"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  tags       = var.default_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4   = "200.50.204.81/32" #Ajustar para o seu IP publico
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  tags       = var.default_tags
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" #Equivalente a todas as portas
  tags       = var.default_tags
}