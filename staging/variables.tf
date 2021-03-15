variable "environment" {
  description = "Defines the environment of the infrastructure"
  type        = string
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string
  default     = "poc-customer-datalake"
}

variable "entrypoint_sqs_queue_name" {
  description = "SQS queue name"
  type        = string
  default     = "default-entrypoint-sqs-queue"
}

variable "entrypoint_sqs_dlq_name" {
  description = "Entrypoint SQS dlq max message timeout"
  type        = string
  default     = "default-entrypoint-sqs-dlq"
}

variable "entrypoint_sqs_role_name" {
  description = "Entrypoint SQS role name"
  type        = string
}

variable "entrypoint_sqs_dlq" {
  description = "Entrypoint SQS dlq queue name"
  type        = string
  default     = "default-entrypoint-sqs-dlq"
}

variable "entrypoint_sqs_message_retention_seconds" {
  description = "Entrypoint SQS message retention seconds"
  type        = number
  default     = 259200 # 3 days
}

variable "entrypoint_sqs_dlq_message_retention_seconds" {
  description = "Entrypoint SQS DLQ message retention seconds"
  type        = number
  default     = 604800 # 7 days
}

variable "all_sqs_visibility_timeout_seconds" {
  description = "Entrypoint SQS visibility timeout"
  type        = number
  default     = 0
}

variable "all_sqs_max_message_size" {
  description = "Entrypoint SQS max message timeout"
  type        = number
  default     = 0
}

variable "sqs_read_post_policy_name" {
  description = "Read and post policy for sqs"
  type        = string
}

variable "aws_logs_policy_name" {
  description = "AWS logs policy name"
  type        = string
}






