
resource "huaweicloud_compute_instance" "terra001" {
  name             = "BID-TERRA01"
  image_id         = "7d8e8da9-1d10-4a0d-8b3e-fef3ffcfc948"
  flavor_name      = "s6.medium.2"
  security_groups  = ["LAN"]
  system_disk_type = "SAS"
  network {
    uuid = "c8afe385-7b79-48fd-9c9b-842b3713d4ed"
  }
  user_data = <<-EOF
              #!/bin/bash
              echo "Hola Terraformers!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

resource "huaweicloud_compute_instance" "terra002" {
  region           = "na-mexico-1"
  name             = "BID-TERRA02"
  image_id         = "c9f6ab45-1976-4491-87e5-303b1d0fdc08"
  flavor_name      = "s6.medium.2"
  security_groups  = ["LANtoLAN-PrePprod-S138"]
  system_disk_type = "SAS"
  network {
    uuid = "958df2d4-b874-497c-a852-26a40448bad6"
  }
  user_data = <<-EOF
              #!/bin/bash
              echo "Hola Terraformers!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}


