/*
  Este arquivo serve apenas para declarar as variaveis, os tipos e setar valores default
  o arquivo terraform.tfvars é o que realmente contém o valor dos variáveis
  Não é obrigatório que façamos esta declaração, mas ajuda na organização e entendimento de cada variavel
*/
variable "environment" {
  description = "Defines the environment of the infrastructure"
  type        = string
}

variable "firehose_role_name" {
  description = "Name of the role chosen for Firehose"
  type        = string
  default     = "FirehoseRole"
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string
  default     = "bucket-poc-datalake"
}

variable "kinesis_stream_name" {
  description = "Kinesis Stream Name"
  type        = string
  default     = "KinesisStreamDefaultName"
}

variable "kinesis_shard_count" {
  description = "Number of shards in Kinesis Stream"
  type        = number
  default     = 1
}

variable "kinesis_retention_period" {
  description = "Hours that the data records are accessible after they are added to the stream. Values must be between 24 and 168."
  type        = number
  default     = 24
}

variable "kinesis_firehose_name" {
  description = "Kinesis Firehose Delivery Name"
  type        = string
  default     = "KinesisFirehoseDefaultName"
}

variable "kinesis_firehose_buffer_interval" {
  description = "Firehose buffer interval"
  type        = number
  default     = 60
}
variable "kinesis_firehose_buffer_size" {
  description = "Firehose buffer size"
  type        = number
  default     = 5
}
