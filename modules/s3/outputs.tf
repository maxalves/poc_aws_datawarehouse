/*
  Quando criamos um recurso podemos disponibilizar os dados dele como variavel, neste caso, atribuímos bucket_arn o valor do arn
  do nosso S3, isso vai ser utilizado posteriormente pelo kinesis para saber para qual bucket enviar os dados
  https://www.terraform.io/docs/language/values/outputs.html
*/
output "bucket_arn" {
  value       = aws_s3_bucket.raw_bucket.arn
  description = "S3 destination Bucket ARN"
}