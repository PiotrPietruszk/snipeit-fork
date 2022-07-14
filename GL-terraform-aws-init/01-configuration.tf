terraform {

  backend "s3" {
    bucket = "gl-piotrpietruszka-snipe-it"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}