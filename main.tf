
# Nombres de los VPCs

variable "vpc_terra1" {
  default = "terra1_vpc"
}

# CIDR de los VPCs
variable "vpc_cidr_terra1" {
  default = "172.24.0.0/16"
}

variable "terra1_gateway_ip" {
  default = "172.24.10.1"
}


resource "huaweicloud_vpc" "vpc_with_tags" {
  name = var.vpc_terra1
  cidr = var.vpc_cidr_terra1
  tags = {
    Ambiente = "DEV"
    Otrigen  = "terraform"
  }
}

resource "huaweicloud_vpc_subnet" "subnet1" {
  name       = "terra1-web"
  cidr       = "172.24.10.0/24"
  gateway_ip = var.terra1_gateway_ip
  vpc_id     = huaweicloud_vpc.vpc_with_tags.id
  # dns_list   = ["100.125.1.250", "100.125.129.250"]
}
resource "huaweicloud_vpc_subnet" "subnet2" {
  name       = "terra1-app"
  cidr       = "172.24.11.0/24"
  gateway_ip = "172.24.11.1"
  vpc_id     = huaweicloud_vpc.vpc_with_tags.id
  # dns_list   = ["100.125.1.250", "100.125.129.250"]
}
resource "huaweicloud_vpc_subnet" "subnet3" {
  name       = "terra2-db"
  cidr       = "172.24.12.0/24"
  gateway_ip = "172.24.12.1"
  vpc_id     = huaweicloud_vpc.vpc_with_tags.id
  # dns_list   = ["100.125.1.250", "100.125.129.250"]
}

