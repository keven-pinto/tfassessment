terraform {
  backend "s3" {
    bucket = "colibridigitalstatebucket"
    key    = "dev/terraform.tfstate"
  }
}
