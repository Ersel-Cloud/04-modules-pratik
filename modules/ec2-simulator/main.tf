resource "aws_instance" "module_server" {
  for_each      = var.server_configs
  ami           = "ami-0084a47cc718c111a" # Frankfurt Ubuntu AMI
  instance_type = each.value.instance_type

security_groups = [aws_security_group.simulator_sg.name]

  tags = {
    Name        = "Ersel-Module-${var.environment_name}-${each.key}"
    Environment = var.environment_name
    Simulated   = "LocalStack"  # <-- Bunu ekle
  }
}

resource "aws_vpc" "simulator_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "Ersel-VPC-${var.environment_name}"
  }
}

resource "aws_security_group" "simulator_sg" {
  name        = "ersel-sg-${var.environment_name}"
  description = "Simüle edilmiş güvenlik grubu"
  vpc_id      = aws_vpc.simulator_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

