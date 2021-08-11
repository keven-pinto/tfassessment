variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket -- these need to be Globally Unique"
}

variable "alias" {
  type        = string
  default     = ""
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash."
}

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

variable "athena_output_bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket to store Athena Output"
}

variable "file_name" {
  type        = string
  default     = ""
  description = "Name of the file (iris.csv) to Upload"
}

variable "file_path" {
  type        = string
  default     = ""
  description = "Location of the File"
}

variable "workgroup_name" {
  type        = string
  default     = ""
  description = "Name of the Athena WorkGroup"
}

variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "Region in which the Bucket Resides"
}