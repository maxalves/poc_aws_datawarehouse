/*
 Este é o nome bucket que ficará com os arquivos processados pelo Kinesis Data Firehose
*/
bucket_name                        = "bucket-poc-datawarehouse"

/*
    Este repositório já foi feito pensando que podemos ter multiplos ambientes
    como estamos na pasta staging o enviroment tem o mesmo nome, caso queiramos criar
    outros ambientes temos que criar outra pasta para este respectivo ambiente
*/
environment                        = "staging"
