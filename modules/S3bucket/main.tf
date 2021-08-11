resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_target_key_arn
        sse_algorithm = "aws:kms"
      }
    }
  }
  lifecycle {
    prevent_destroy = false
  }
}

output "bucket_id" {
  value = aws_s3_bucket.mybucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.mybucket.arn
}

output "bucket" {
  value = aws_s3_bucket.mybucket.bucket
}
