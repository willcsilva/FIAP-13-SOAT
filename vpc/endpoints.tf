##Endpoint EC2

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.us-east-2.ec2"
  vpc_endpoint_type = "Interface"
   
   subnet_ids = [
    aws_subnet.subnet.id ]

  security_group_ids = [
    aws_security_group.security_group.id,
  ]

  private_dns_enabled = true
}

##Endpoint ECR-API

resource "aws_vpc_endpoint" "ecr" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.us-east-2.ecr.api"
  vpc_endpoint_type = "Interface"
   
   subnet_ids = [
    aws_subnet.subnet.id ]

  security_group_ids = [
    aws_security_group.security_group.id,
  ]

  private_dns_enabled = false
}

##Endpoint ECR-DKR

resource "aws_vpc_endpoint" "ecr-dkr" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.us-east-2.ecr.dkr"
  vpc_endpoint_type = "Interface"
   
   subnet_ids = [
    aws_subnet.subnet.id ]

  security_group_ids = [
    aws_security_group.security_group.id,
  ]

  private_dns_enabled = false
}

##Endpoint S3

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.us-east-2.s3"
  vpc_endpoint_type = "Gateway"
   
   route_table_ids  = [
    aws_route_table.route_table.id ]

  private_dns_enabled = false
}