output "queue_id" {
  description = "The ID of the main SQS queue"
  value       = aws_sqs_queue.main.id
}

output "queue_arn" {
  description = "The ARN of the main SQS queue"
  value       = aws_sqs_queue.main.arn
}

output "queue_url" {
  description = "The URL of the main SQS queue"
  value       = aws_sqs_queue.main.url
}

output "dlq_id" {
  description = "The ID of the dead letter queue (if created)"
  value       = var.dead_letter_enabled ? aws_sqs_queue.dlq[0].id : null
}

output "dlq_arn" {
  description = "The ARN of the dead letter queue (if created)"
  value       = var.dead_letter_enabled ? aws_sqs_queue.dlq[0].arn : null
}

output "dlq_url" {
  description = "The URL of the dead letter queue (if created)"
  value       = var.dead_letter_enabled ? aws_sqs_queue.dlq[0].url : null
}