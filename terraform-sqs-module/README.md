# Terraform AWS SQS Module

This Terraform module allows for flexible and secure provisioning of AWS SQS queues. It supports standard and FIFO queues, optional dead letter queues (DLQ), encryption using AWS-managed KMS keys, and a variety of queue settings to adapt to different workload requirements.

## Features

- Support for both **Standard** and **FIFO** queues
- Optional **Dead Letter Queue (DLQ)** integration
- Enforced **encryption at rest** with AWS-managed KMS
- Configurable:
  - Queue name
  - Message retention
  - Visibility timeout
  - Max message size
  - Delay and deduplication settings
- Full set of **outputs** for main and DLQ queues

## Usage

```hcl
module "sqs" {
  source                    = "./path-to-module"
  name                      = "my-app-queue"
  fifo_queue                = true
  content_based_deduplication = true
  delay_seconds             = 10
  dead_letter_enabled       = true
  max_receive_count         = 3
}
```

## Inputs

| Name                        | Type    | Default     | Description |
|-----------------------------|---------|-------------|-------------|
| `name`                      | string  | n/a         | Name of the SQS queue |
| `max_message_size`          | number  | 262144      | Max size in bytes |
| `message_retention_seconds`| number  | 345600      | Retention period |
| `visibility_timeout_seconds`| number | 30          | Visibility timeout |
| `fifo_queue`                | bool    | false       | Whether to use FIFO |
| `content_based_deduplication` | bool | true        | For FIFO queues |
| `delay_seconds`             | number  | 0           | Delivery delay |
| `receive_wait_time_seconds`| number  | 0           | Wait time for receive |
| `dead_letter_enabled`       | bool    | false       | Enable DLQ |
| `max_receive_count`         | number  | 5           | Retry count for DLQ |

## Outputs

| Name        | Description                     |
|-------------|---------------------------------|
| `queue_id`  | ID of the main queue            |
| `queue_arn` | ARN of the main queue           |
| `queue_url` | URL of the main queue           |
| `dlq_id`    | ID of the DLQ (if created)      |
| `dlq_arn`   | ARN of the DLQ (if created)     |
| `dlq_url`   | URL of the DLQ (if created)     |

## Documentation

See the full walkthrough in [terraform_sqs_module_walkthrough.pdf](./terraform_sqs_module_walkthrough.pdf) for a line-by-line explanation.

## License

This project is licensed under the MIT License.