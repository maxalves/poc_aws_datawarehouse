terraform {
  backend "s3" {
    bucket = "terraform-states-poc-datawarehouse"
    key    = "project/terraform.tfstate"
    region = "us-east-1"
  }
}