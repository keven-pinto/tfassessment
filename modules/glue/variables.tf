variable "database_name" {
  type        = string
  default     = ""
  description = "Name of the Glue Catalogue Database"
}

variable "glue_table" {
  type        = string
  default     = ""
  description = "Name of the Glue Table"
}

variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket -- these need to be Globally Unique"
}