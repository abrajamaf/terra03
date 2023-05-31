
# Nombres de los VPCs

variable "vpc_terra1" {
  default = "terra1_vpc"
}

# CIDR de los VPCs
variable "vpc_cidr_terra1" {
  default = "172.24.0.0/16"
}

# Data sources 
data "huaweicloud_availability_zones" "mexico_2" {
  region = "la-north-2"
  state  = "available"
}
data "huaweicloud_compute_flavors" "myflavor" {
  availability_zone = data.huaweicloud_availability_zones.mexico_2.names[0]
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 2
}

data "huaweicloud_images_image" "myimage" {
  os          = "Ubuntu"
  visibility  = "public"
  most_recent = true
}



resource "huaweicloud_vpc" "vpc_with_tags" {
  name = var.vpc_terra1
  cidr = var.vpc_cidr_terra1
  tags = {
    Ambiente = "DEV"
    Otrigen  = "terraform"
  }
}

# Sunredes de terra1
resource "huaweicloud_vpc_subnet" "subnet1" {
  name              = "terra1-az1"
  cidr              = "172.24.10.0/24"
  gateway_ip        = "172.24.10.1"
  ipv6_enable       = false
  availability_zone = data.huaweicloud_availability_zones.mexico_2.names[0]
  vpc_id            = huaweicloud_vpc.vpc_with_tags.id
  # dns_list   = ["100.125.1.250", "100.125.129.250"]
}
resource "huaweicloud_vpc_subnet" "subnet2" {
  name              = "terra1-az3"
  cidr              = "172.24.11.0/24"
  gateway_ip        = "172.24.11.1"
  ipv6_enable       = false
  availability_zone = data.huaweicloud_availability_zones.mexico_2.names[1]
  vpc_id            = huaweicloud_vpc.vpc_with_tags.id
  # dns_list   = ["100.125.1.250", "100.125.129.250"]
}

# Instancias ECS
# variable "secgroup_id" {}


resource "huaweicloud_compute_instance" "ecs_basic01" {
  name      = "ecs_terra01"
  image_id  = data.huaweicloud_images_image.myimage.id
  flavor_id = data.huaweicloud_compute_flavors.myflavor.ids[0]
  # security_group_ids = [var.secgoup_id]
  # availability_zone  = data.huaweicloud_availability_zones.mexico_2.names[0]

  network {
    uuid = huaweicloud_vpc_subnet.subnet1.id
  }
}

resource "huaweicloud_compute_instance" "ecs_basic02" {
  name      = "ecs_terra02"
  image_id  = data.huaweicloud_images_image.myimage.id
  flavor_id = data.huaweicloud_compute_flavors.myflavor.ids[0]
  # security_group_ids = [var.secgroup_id]
  availability_zone  = data.huaweicloud_availability_zones.mexico_2.names[1]

  network {
    uuid = huaweicloud_vpc_subnet.subnet2.id
  }
}


