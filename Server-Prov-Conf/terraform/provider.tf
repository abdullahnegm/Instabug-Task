terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region            = var.REGION
    access_key        = var.AWS_ACCESS_KEY
    secret_key        = var.AWS_SECRET_KEY
    token = var.AWS_SESSION_TOKEN
}
