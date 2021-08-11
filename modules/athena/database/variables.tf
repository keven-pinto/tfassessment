variable "aws_athena_database_name" {
  type        = string
  default     = ""
  description = "Name of the Athena Database"
}

variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 Bucket the DB points to"
}

variable "kms_key_arn" {
  type        = string
  default     = ""
  description = "Arn of the Encryption Key"
}