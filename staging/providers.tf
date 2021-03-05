/*
    Configuração do nosso provider
    https://www.terraform.io/docs/language/providers/requirements.html
*/
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-east-1" 
}