bucket_name = "poc-customer-datalake"
environment = "staging"

###################### GLOBALS ########################
all_sqs_max_message_size           = 259200 # (25kb) This is the maximum size of a message in bytes
all_sqs_visibility_timeout_seconds = 120 # 2 minutes
aws_logs_policy_name               = "aws-logs-policy"
sqs_read_post_policy_name          = "sqs-read-and-post-policy"
#######################################################

# Entrypoint SQS
entrypoint_sqs_queue_name = "entrypoint-sqs-queue"
entrypoint_sqs_message_retention_seconds = 25000 # 3 days
entrypoint_sqs_role_name = "entrypoint-sqs-role"

# Entrypoint SQS DLQ
entrypoint_sqs_dlq_name = "entrypoint-sqs-dlq"
entrypoint_sqs_dlq_message_retention_seconds = 604800 # 7 days

