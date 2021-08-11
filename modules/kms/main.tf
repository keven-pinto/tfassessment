resource "aws_kms_key" "mykey" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.mykey.key_id
}

output "aws_kms_alias_name" {
  value = aws_kms_alias.alias.name
}

output "kms_target_key_arn" {
  value = aws_kms_alias.alias.target_key_arn
}

output "kms_key_id" {
  value = aws_kms_key.mykey.id
}