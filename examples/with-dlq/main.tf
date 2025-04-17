provider "aws" {
  region = "us-east-1"
}

module "queue_with_dlq" {
  source              = "../../terraform-aws-sqs-module"
  name                = "dlq-queue"
  dead_letter_enabled = true
  max_receive_count   = 5
}
