# Creates s3 Datalake
module "aws_s3" {
  source      = "../modules/s3"
  environment = var.environment
  bucket_name = "${var.bucket_name}-${var.environment}"
}

# Creates dlq for entrypoint queue
module "entrypoint_sqs_dlq" {
  source                     = "../modules/sqs/sqs_without_dlq"
  environment                = var.environment
  sqs_queue_name             = var.entrypoint_sqs_dlq_name
  max_message_size           = var.all_sqs_max_message_size
  visibility_timeout_seconds = var.all_sqs_visibility_timeout_seconds
  message_retention_seconds  = var.entrypoint_sqs_message_retention_seconds
}

# Creates sqs entrypoint where all data is received and associate with it's dlq
module "entrypoint_sqs_queue_with_dlq" {
  source                    = "../modules/sqs/sqs_with_dlq"
  environment               = var.environment
  sqs_with_dlq_name         = var.entrypoint_sqs_queue_name
  max_message_size          = var.all_sqs_max_message_size
  sqs_dlq_arn               = module.entrypoint_sqs_dlq.sqs_arn
  message_retention_seconds = var.entrypoint_sqs_dlq_message_retention_seconds
}

# Creates SQS role used to send and read data from SQS
module "entrypoint_sqs_role_and_policies" {
  source                    = "../modules/iam"
  environment               = var.environment
  aws_logs_policy_name      = var.aws_logs_policy_name
  sqs_role_name             = var.entrypoint_sqs_role_name
  sqs_policy_name           = var.sqs_read_post_policy_name
  sqs_arn                   = module.entrypoint_sqs_queue_with_dlq.sqs_arn
}

module "entrypoint_api_gateway" {
  source                    = "../modules/api_gateway"
  api_gateway_name = "testa"
  description = "testa"
}