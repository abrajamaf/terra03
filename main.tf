
# Nombres de los VPCs

variable "vpc_terra1" {
  default = "terra1_vpc"
}

variable "vpc_terra2" {
  default = "terra2_vpc"
}

# CIDR de los VPCs
variable "vpc_cidr_terra1" {
  default = "172.24.0.0/16"
}

variable "vpc_cidr_terra2" {
  default = "192.25.0.0/16"
}

# crea los VPCs
resource "huaweicloud_vpc" "vpc_terra1" {
  name = var.vpc_terra1
  cidr = var.vpc_cidr_terra1
}

resource "huaweicloud_vpc" "vpc_terra2" {
  name = var.vpc_terra2
  cidr = var.vpc_cidr_terra2
}

resource "huaweicloud_vpc" "vpc_with_tags" {
  name = var.vpc_terra1
  cidr = var.vpc_cidr_terra1

  tags = {
    Ambiente = "DEV"
    Otrigen = "trrraform"
  }
}