variable "workgroup_name" {
  type        = string
  default     = ""
  description = "Name of the Athena WorkGroup"
}

variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 Bucket the Outputs points to"
}

variable "kms_key_arn" {
  type        = string
  default     = ""
  description = "Arn of the Encryption Key"
}