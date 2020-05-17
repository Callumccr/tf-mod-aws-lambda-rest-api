terraform {
  backend "s3" {}
  required_version = ">= 0.12.12"
  required_providers {
    aws = ">= 2.7.0"
  }
}
