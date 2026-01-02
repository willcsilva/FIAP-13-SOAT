resource "aws_key_pair" "key" {
  key_name   = "aws-key" # Ajustar para o nome da sua chave
  public_key = file("./id_ed25519.pub") # Ajustar para o caminho da sua chave pública (A PIPELINE PRECISA CRIAR ESSA CHAVE. DEFINA UM SCRIPT .SH PARA ISSO)
}

variable "instance_count" {
  description = "Quantidade de instâncias EC2 Spot"
  type        = number
  default     = 2
}

resource "aws_instance" "vm" {
  count                       = var.instance_count
  ami                         = "ami-06971c49acd687c30" # AMI Amazon Linux 2 na região us-east-2. Valide AMI na sua conta AWS e região.
  instance_type               = "t3a.medium"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.aws_subnet.subnet.id
  vpc_security_group_ids      = [data.aws_security_group.security_group.id]
  associate_public_ip_address = true

  instance_market_options {
    market_type = "spot"
  }

  tags = {
    Name        = "VM-Fiap-13-soat-${count.index + 1}"
    Global      = "Ohio"
    Region      = "US-East-2"
    Environment = "SBX"
    ManagedBy   = "Terraform"
  }
}