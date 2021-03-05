/*
  Quando criamos um recurso podemos disponibilizar os dados dele como variavel, neste caso, atribuímos kinesis_stream_arn o valor do arn
  do kinesis stream que acabamos de criar, o arn é o identificador único da AWS para cada recurso.
  Neste caso utilizaremos este valor no kinesis firehose para sabermos de onde consumir os eventos.
  https://www.terraform.io/docs/language/values/outputs.html
*/
output "kinesis_stream_arn" {
  value       = aws_kinesis_stream.kinesis_stream.arn
  description = "Kinesis Stream ARN"
}