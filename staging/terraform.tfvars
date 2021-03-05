/*
 Nome do bucket que servirá como datalake para os dados ainda não processados
 aqui guardaremos os dados "crus" que passaram pelo kinesis firehose e são salvos em formato parquet
*/
bucket_name                        = "bucket-poc-datalake"


/*
    Este repositório já foi feito pensando que podemos ter multiplos ambientes
    como estamos na pasta staging o enviroment tem o mesmo nome, caso queiramos criar
    outros ambientes temos que criar outra pasta para este respectivo ambiente
*/
environment                        = "staging"


/*
    Variaveis com os valores de configuração do kinesis firehose
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream*/
kinesis_stream_name                = "EuSouAStreamQueRecebeTodosOsDados"
kinesis_retention_period           = 24
kinesis_shard_count                = 1


/*
    Variaveis com os valores de configuração do kinesis firehose
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream
*/
kinesis_firehose_name              = "EuPegoCoisasDoKinesisEJogoNoS3NoFormatoParquet"
kinesis_firehose_buffer_interval   = 60
kinesis_firehose_buffer_size       = 5


# Para publicar coisas no S3 o firehose precisa de uma role que o dê permissão para tal ação
firehose_role_name                 = "FirehoseRole"

