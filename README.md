# terraform-simple-aws-sqs-example

A simple and reusable Terraform example that demonstrates how to provision AWS SQS queues with configurable options such as:
- Standard vs. FIFO queues
- Optional Dead Letter Queues (DLQs)
- Encryption via AWS-managed KMS
- Message timeout, delay, and retention settings

This example module is ideal for learning, testing, or as a starting point for production-ready infrastructure.

---

## ✨ Features

- ✅ Create standard or FIFO SQS queues
- ✅ Enable content-based deduplication for FIFO
- ✅ Add optional Dead Letter Queues (DLQ)
- ✅ Configure message retention, delay, visibility timeout, and long polling
- ✅ Enforce encryption using AWS-managed KMS (`alias/aws/sqs`)
- ✅ Output key attributes for integration (ARN, URL, ID)

---

## 📁 Directory Structure

```bash
terraform-simple-aws-sqs-example/
├── examples/
│   ├── basic/
│   │   └── main.tf
│   ├── with-dlq/
│   │   └── main.tf
│   ├── with-fifo/
│   │   └── main.tf
│   └── with-fifo-and-dlq/
│       └── main.tf
├── terraform-aws-sqs-module/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
└── README.md  ← this file
```

---

## 📥 Inputs

| Name                        | Description                                               | Type   | Required                    |
|:----------------------------|:----------------------------------------------------------|:-------|:----------------------------|
| `name`                      | Name of the SQS queue                                     | string | required                    |
| `fifo_queue`                | Whether the queue should be FIFO                          | bool   | optional (default = false)  |
| `max_message_size`          | Maximum message size in bytes (1KB - 256KB)               | number | optional (default = 262144) |
| `message_retention_seconds` | Message retention in seconds (60s - 14d)                  | number | optional (default = 345600) |
| `visibility_timeout_seconds`| Visibility timeout in seconds (0s - 12h)                  | number | optional (default = 30)     |
| `content_based_deduplication`| Enable content-based deduplication for FIFO queues       | bool   | optional (default = true)   |
| `delay_seconds`             | Delay in seconds before delivering messages (0s - 900s)   | number | optional (default = 0)      |
| `receive_wait_time_seconds` | Long polling wait time in seconds (0s - 20s)              | number | optional (default = 0)      |
| `dead_letter_enabled`       | Whether to create a Dead Letter Queue                     | bool   | optional (default = false)  |
| `max_receive_count`         | Number of receives before message moves to DLQ (1 - 1000) | number | optional (default = 5)      |

---

## 🚀 Usage Instructions

### 🔧 Set up AWS credentials

Make sure you’ve configured AWS credentials using:

```bash
aws configure
```

### 📦 Initialize and apply a specific example

```bash
cd examples/basic
terraform init
terraform apply
```

> To test different configurations, use the other folders under `examples/`.

---

## 💡 Example Configurations

- [Basic SQS](./examples/basic)
- [SQS with DLQ](./examples/with-dlq)
- [FIFO Queue](./examples/with-fifo)
- [FIFO Queue with DLQ](./examples/with-fifo-and-dlq)

---

## ✅ Requirements

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) 1.3+
- AWS credentials configured via CLI, environment variables, or IAM roles

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.