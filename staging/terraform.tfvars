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
