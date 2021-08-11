terraform {
  backend "s3" {
    bucket = "<changeme>"
    key    = "test/terraform.tfstate"
  }
}