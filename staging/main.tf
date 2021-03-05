/*
  Carrega o módulo responsável pela criação do S3, passa nossas variaveis para o módulo
  https://www.terraform.io/docs/language/modules/index.html
*/
module "aws_s3" {
  source      = "../modules/s3"
  environment = var.environment
  bucket_name = "${var.bucket_name}-${var.environment}"
}