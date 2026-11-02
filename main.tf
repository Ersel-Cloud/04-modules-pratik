provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
  }
}

variable "environments" {
  type = map(string)
  default = {
    staging = "t3.micro"
    prod    = "t3.micro"
  }
}

module "ec2_cluster" {
  for_each = var.environments
  source   = "./modules/ec2-simulator"

  environment_name = each.key
  instance_type    = each.value
}

terraform {
  backend "s3" {
    bucket                      = "ersel-tf-state-bucket"
    key                         = "state/terraform.tfstate"
    region                      = "eu-central-1"
    dynamodb_table              = "terraform-lock-table"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
    force_path_style            = true
    skip_requesting_account_id  = true

    endpoints = {
      s3       = "http://localhost:4566"
      dynamodb = "http://localhost:4566"
      sts      = "http://localhost:4566"
    }
  }
}