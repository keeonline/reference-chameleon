terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      AppEnvironment   = "${var.app_environment}"
      IacVersion       = "${var.app_version}"
      IacRepo          = "${var.app_repo}"
      InfraEnvironment = "${var.infra_environment}"
    }
  }
}