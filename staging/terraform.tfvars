bucket_name                        = "bucket-poc-datalake"
environment                        = "staging"
kinesis_stream_name                = "EuSouAStreamQueRecebeTodosOsDados"
kinesis_retention_period           = 24
kinesis_shard_count                = 1
kinesis_firehose_name              = "EuPegoCoisasDoKinesisEJogoNoS3NoFormatoParquet"
kinesis_firehose_buffer_interval   = 60
kinesis_firehose_buffer_size       = 5
firehose_role_name                 = "FirehoseRole"

