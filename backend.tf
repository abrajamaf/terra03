
terraform {
  backend "s3" {
    bucket   = "bid-vm-export"
    key      = "terra/state03/terraform.tfstate"
    region   = "na-mexico-1"
    endpoint = "https://obs.na-mexico-1.myhuaweicloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
