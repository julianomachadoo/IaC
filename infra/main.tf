terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.instacia
  key_name      = var.chave
  tags = {
    Name = "Terraform Ansible Python ${var.ambiente}"
  }
}

resource "aws_key_pair" "chaveSSh" {
  key_name   = var.chave
  public_key = file("${var.chave}.pub")
}

output "IP_publico" {
  value = aws_instance.app_server.public_ip
  
}
