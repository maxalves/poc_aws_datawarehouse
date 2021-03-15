terraform {
  backend "s3" {
    bucket = "tfstates-poc-customer-datalake"
    key    = "project/terraform.tfstate"
    region = "us-east-1"
  }
}