resource "aws_athena_database" "athenadb" {
  name   = var.aws_athena_database_name
  bucket = var.bucket_name
  force_destroy = true
  encryption_configuration {
    encryption_option = "SSE_KMS"
    kms_key       = var.kms_key_arn
  }
}