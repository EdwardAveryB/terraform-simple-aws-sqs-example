provider "aws" {
  region = "us-east-1"
}

module "basic_queue" {
  source = "../../terraform-aws-sqs-module"
  name   = "basic-queue"
}
