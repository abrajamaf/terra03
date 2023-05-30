terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.46.0"
    }
  }
}

# Configure the HUAWEI CLOUD provider.
provider "huaweicloud" {}
#  region     = "HW_REGION_NAME"
#  access_key = "HW_ACCESS_KEY"
#  secret_key = "HW_REGION_NAME"
#}
