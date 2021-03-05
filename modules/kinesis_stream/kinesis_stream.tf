/*
  O kinesis data stream é onde nossos eventos serão recebidos
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream
*/
resource "aws_kinesis_stream" "kinesis_stream" {
  name             = var.kinesis_stream_name
  shard_count      = var.kinesis_shard_count
  retention_period = var.kinesis_retention_period
  tags = {
    "Environment" : var.environment
  }
}
