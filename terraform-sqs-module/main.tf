resource "aws_sqs_queue" "main" {
  name                              = var.fifo_queue ? "${var.name}.fifo" : var.name
  fifo_queue                        = var.fifo_queue
  content_based_deduplication      = var.fifo_queue ? var.content_based_deduplication : null
  delay_seconds                     = var.delay_seconds
  max_message_size                  = var.max_message_size
  message_retention_seconds        = var.message_retention_seconds
  visibility_timeout_seconds       = var.visibility_timeout_seconds
  receive_wait_time_seconds        = var.receive_wait_time_seconds
  kms_master_key_id                = "alias/aws/sqs"

  redrive_policy = var.dead_letter_enabled ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null
}

resource "aws_sqs_queue" "dlq" {
  count                             = var.dead_letter_enabled ? 1 : 0
  name                              = var.fifo_queue ? "${var.name}-dlq.fifo" : "${var.name}-dlq"
  fifo_queue                        = var.fifo_queue
  content_based_deduplication      = var.fifo_queue ? var.content_based_deduplication : null
  kms_master_key_id                = "alias/aws/sqs"
}