terraform {
  backend "s3" {
    bucket = "colibridigitalstatebucket"
    key    = "prod/terraform.tfstate"
  }
}