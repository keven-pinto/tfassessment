resource "aws_s3_bucket_policy" "upload_only_kms_encrypted_files" {
  bucket = var.bucket_name
  policy = var.upload_policy
}
