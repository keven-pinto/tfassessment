variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket -- these need to be Globally Unique"
}

variable "kms_target_key_arn" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket -- these need to be Globally Unique"
}
