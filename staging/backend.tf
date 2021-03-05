/*
 This is where states are stored
 https://www.terraform.io/docs/language/settings/backends/index.html
*/
terraform {
  backend "s3" {
    bucket = "terraform-states-poc-datawarehouse"
    key    = "project/terraform.tfstate"
    region = "us-east-1"
  }
}