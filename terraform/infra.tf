terraform {
  required_version = ">= 1.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.39"
    }
  }
}

provider "aws" {
  region                   = "us-east-2"
  shared_credentials_files = ["~/.aws/credentials"]
}

module "s3-static-site" {
  source = "github.com/Bjorn248/s3-static-site?ref=0.2.0"

  root-domain            = "babyfelix.party"
  cloudfront-price-class = "PriceClass_100"
  create_deployer_iam    = true

  global-tags = {
    project = "babyfelix-party"
  }
}
