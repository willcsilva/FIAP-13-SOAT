# Busca a VPC default
data "aws_vpc" "vpc" {
  default = true
}

# Busca as subnets da VPC default
data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_security_group.security_group.vpc_id]
  }
}

# Seleciona a primeira subnet retornada
data "aws_subnet" "subnet" {
  id = data.aws_subnets.subnet.ids[0]
}

# Busca um security group existente pelo ID
data "aws_security_group" "security_group" {
  filter {
    name   = "group-id"
    values = ["sg-0c766e3b64947a744"] # Substitua pelo ID do seu security group criado na VPC
  }
}