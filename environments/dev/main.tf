provider "aws" {
    region                      = "eu-central-1"
    access_key                  = "mock_access_key"
    secret_key                  = "mock_secret_key"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    endpoints {
        ec2 = "http://localhost:4566"
    }
}

module "dev_server" {
    source      = "../../modules/ec2-simulator"
    environment_name = "dev"

    server_configs = {
        web = { instance_type = "t3.micro"}
        db  = { instance_type = "t3.medium"}
    }
}
