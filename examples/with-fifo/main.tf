provider "aws" {
  region = "us-east-1"
}

module "fifo_queue" {
  source                       = "../../terraform-aws-sqs-module"
  name                         = "fifo-queue"
  fifo_queue                   = true
  content_based_deduplication = true
}
