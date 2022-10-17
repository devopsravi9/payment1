provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-rk01"
    key    = "ami/payment/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ami" {
  source = "https://github.com/devopsravi9/module-immutable-app-ami.git"
  COMPONENT = "payment"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}