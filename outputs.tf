output "nombre_del_server_DC01" {
  description = "Nombre de la instancia en DC01"
  value       = huaweicloud_compute_instance.terra001.name
}
output "internal_ip_DC01" {
  description = "IP interna en DC01"
  value       = huaweicloud_compute_instance.terra001.access_ip_v4
}
output "public_ip_DC01" {
  description = "IP publica en DC01"
  value       = huaweicloud_compute_instance.terra001.public_ip
}

output "nombre_del_server_DC02" {
  description = "Nombre de la instancia en DC02"
  value       = huaweicloud_compute_instance.terra002.name
}
output "internal_ip_DC02" {
  description = "IP internaen DC02"
  value       = huaweicloud_compute_instance.terra002.access_ip_v4
}
output "public_ip_DC02" {
  description = "IP publica en DC02"
  value       = huaweicloud_compute_instance.terra002.public_ip
}