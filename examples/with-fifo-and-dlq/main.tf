provider "aws" {
  region = "us-east-1"
}

module "fifo_dlq_queue" {
  source                       = "../../terraform-aws-sqs-module"
  name                         = "fifo-dlq-queue"
  fifo_queue                   = true
  content_based_deduplication = true
  dead_letter_enabled          = true
  max_receive_count            = 3
}
