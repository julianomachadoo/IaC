module "aws-prod" {
  source = "../../infra"
  instacia = "t2.micro"
  regiao_aws = "us-east-1"
  chave = "iac-prod"
  ambiente = "prod"
}

output "IP" {
  value = module.aws-prod.IP_publico
}