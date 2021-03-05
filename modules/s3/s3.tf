/*
  Criação do bucket s3 onde ficarão os dados no formato parquet após processamento do kinesis
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
*/
resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags = {
    "Environment" : var.environment
  }
}
