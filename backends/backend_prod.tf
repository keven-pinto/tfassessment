terraform {
  backend "s3" {
    bucket = "<changeme>"
    key    = "prod/terraform.tfstate"
  }
}