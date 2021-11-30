terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = "ssamko-terraform-state"
    key            = "IAM/instance_roles/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "ssamko-terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  profile = "ssamko"
  region  = "us-west-2"
}


