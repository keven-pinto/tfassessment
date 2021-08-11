locals {
  upload_bucket_name = "${var.bucket_name}-${module.randomid.uuid}"
  athena_output_bucket_name = "${var.athena_output_bucket_name}-${module.randomid.uuid}"
}

// S3 bucket Policy
data "template_file" "upload_policy" {
  template = file("./policies/upload_policy.json")
}

// Adds Random Suffix to Buckets
module "randomid" {
  source = "./modules/uuid"
}

module "create_kms_key" {
  source = "./modules/kms"
  alias = var.alias
}

module "create_upload_bucket" {
  source = "./modules/S3bucket"
  bucket_name = local.upload_bucket_name
  kms_target_key_arn = module.create_kms_key.kms_target_key_arn
}

module "attach_upload_policy_to_bucket" {
  source = "./modules/S3_bucket_policy"
  bucket_name = module.create_upload_bucket.bucket_id
  upload_policy = replace(
  replace(
  data.template_file.upload_policy.rendered,
  "<bucket_name>", local.upload_bucket_name),
  "<kms_key_id>", module.create_kms_key.kms_key_id)
}

module "create_athena_output_bucket" {
  source = "./modules/S3bucket"
  bucket_name = local.athena_output_bucket_name
  kms_target_key_arn = module.create_kms_key.kms_target_key_arn
}


module "create_athena_db" {
  source = "./modules/athena/database"
  aws_athena_database_name = var.database_name
  bucket_name = module.create_upload_bucket.bucket_id
  kms_key_arn = module.create_kms_key.kms_target_key_arn
  depends_on = [module.create_upload_bucket, module.create_kms_key]
}

module "create_glue_table" {
  source = "./modules/glue"
  database_name = var.database_name
  glue_table = var.glue_table
  bucket_name = module.create_upload_bucket.bucket_id
  depends_on = [module.create_athena_db]
}

module "create_athena_workgroup" {
  source = "./modules/athena/workgroup"
  workgroup_name=var.workgroup_name
  bucket_name = module.create_athena_output_bucket.bucket
  kms_key_arn = module.create_kms_key.kms_target_key_arn
  depends_on = [module.create_athena_output_bucket, module.create_kms_key]
}

# Upload CSV up to the Bucket
resource "aws_s3_bucket_object" "uploadfiletoS3" {
  bucket = local.upload_bucket_name
  key = var.file_name
  source = "${var.file_path}/${var.file_name}"
  kms_key_id = module.create_kms_key.kms_target_key_arn
  depends_on = [module.create_glue_table]
}
