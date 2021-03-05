/*
  Carrega o módulo responsável pela criação dos recursos, passa nossas variaveis para o módulo
  https://www.terraform.io/docs/language/modules/index.html
*/


module "iam" {
  source                             = "../modules/iam"
  firehose_role_name                 = var.firehose_role_name
  kinesis_stream_arn                 = module.kinesis_stream.kinesis_stream_arn
  bucket_arn                         = module.aws_s3.bucket_arn
  depends_on                         = [module.kinesis_stream, module.aws_s3]
}


module "kinesis_stream" {
  source                   = "../modules/kinesis_stream"
  environment              = var.environment
  kinesis_stream_name      = var.kinesis_stream_name
  kinesis_shard_count      = var.kinesis_shard_count
  kinesis_retention_period = var.kinesis_retention_period
}


module "kinesis_firehose" {
  source                           = "../modules/kinesis_firehose"
  environment                      = var.environment
  kinesis_firehose_name            = var.kinesis_firehose_name
  kinesis_firehose_buffer_interval = var.kinesis_firehose_buffer_interval
  kinesis_firehose_buffer_size     = var.kinesis_firehose_buffer_size
  kinesis_stream_arn               = module.kinesis_stream.kinesis_stream_arn
  role_arn                         = module.iam.firehose_role_arn
  raw_bucket_arn                   = module.aws_s3.bucket_arn
  depends_on                       = [module.iam, module.aws_s3, module.kinesis_stream]
}


module "aws_s3" {
  source      = "../modules/s3"
  environment = var.environment
  bucket_name = "${var.bucket_name}-${var.environment}"
}
