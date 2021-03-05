/*
  Este arquivo serve apenas para declarar as variaveis, os tipos e setar valores default
  o arquivo terraform.tfvars é o que realmente contém o valor dos variáveis
  Não é obrigatório que façamos esta declaração, mas ajuda na organização e entendimento de cada variavel
*/
variable "environment" {
  description = "Defines the environment of the infrastructure"
  type        = string
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string
  default     = "bucket-poc-datalake"
}