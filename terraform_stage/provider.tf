provider "aws" {
  region  = "us-east-2"
  #profile = "terraform-access"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46"
    }
  }
}