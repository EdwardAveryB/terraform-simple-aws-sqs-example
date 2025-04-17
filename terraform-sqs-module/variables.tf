variable "name" {
  description = "Name of the SQS queue"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "Queue name cannot be empty."
  }
}

variable "fifo_queue" {
  description = "Whether the queue should be FIFO"
  type        = bool
  default     = false
}

variable "max_message_size" {
  description = "Maximum message size in bytes (1,024 - 262,144)"
  type        = number
  default     = 262144

  validation {
    condition     = var.max_message_size >= 1024 && var.max_message_size <= 262144
    error_message = "Max message size must be between 1KB (1024) and 256KB (262144)."
  }
}

variable "message_retention_seconds" {
  description = "Message retention in seconds (60 - 1209600)"
  type        = number
  default     = 345600

  validation {
    condition     = var.message_retention_seconds >= 60 && var.message_retention_seconds <= 1209600
    error_message = "Retention time must be between 60 seconds and 14 days (1,209,600 seconds)."
  }
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout in seconds (0 - 43200)"
  type        = number
  default     = 30

  validation {
    condition     = var.visibility_timeout_seconds >= 0 && var.visibility_timeout_seconds <= 43200
    error_message = "Visibility timeout must be between 0 and 43,200 seconds (12 hours)."
  }
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO queues"
  type        = bool
  default     = true
}

variable "delay_seconds" {
  description = "Delivery delay for messages in seconds (0 - 900)"
  type        = number
  default     = 0

  validation {
    condition     = var.delay_seconds >= 0 && var.delay_seconds <= 900
    error_message = "Delay must be between 0 and 900 seconds (15 minutes)."
  }
}

variable "receive_wait_time_seconds" {
  description = "Wait time for long polling in seconds (0 - 20)"
  type        = number
  default     = 0

  validation {
    condition     = var.receive_wait_time_seconds >= 0 && var.receive_wait_time_seconds <= 20
    error_message = "Receive wait time must be between 0 and 20 seconds."
  }
}

variable "dead_letter_enabled" {
  description = "Whether to create a dead letter queue"
  type        = bool
  default     = false
}

variable "max_receive_count" {
  description = "Number of times a message can be received before going to DLQ (1 - 1000)"
  type        = number
  default     = 5

  validation {
    condition     = var.max_receive_count >= 1 && var.max_receive_count <= 1000
    error_message = "Max receive count must be between 1 and 1000."
  }
}
