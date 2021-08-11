terraform {
  backend "s3" {
    bucket = "colibridigitalstatebucket"
    key    = "test/terraform.tfstate"
  }
}