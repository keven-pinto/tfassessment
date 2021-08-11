variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket to which policy needs attaching"
}

variable "bucket_arn" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket to which policy needs attaching"
}

variable "upload_policy" {}