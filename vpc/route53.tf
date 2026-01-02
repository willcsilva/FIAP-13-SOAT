resource "aws_route53_zone" "route53" {
  name = "willow.tec.br" #Ajustar para o seu domínio
}

resource "aws_route53_record" "route53" {
  allow_overwrite = true
  name            = "willow.tec.br" #Ajustar para o seu domínio
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.route53.zone_id

  records = [
    aws_route53_zone.route53.name_servers[0],
    aws_route53_zone.route53.name_servers[1],
    aws_route53_zone.route53.name_servers[2],
    aws_route53_zone.route53.name_servers[3],
  ]
}
