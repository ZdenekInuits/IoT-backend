output "ip_address_docker1" {
  value = digitalocean_droplet.docker1[*].ipv4_address
  description = "The public IP address of your Droplet application."
}

output "ip_address_docker1_private" {
  value = digitalocean_droplet.docker1[*].ipv4_address_private
  description = "The public IP address of your Droplet application."
}

output "ip_address_docker2" {
  value = digitalocean_droplet.docker2[*].ipv4_address
  description = "The public IP address of your Droplet application."
}

output "ip_address_docker3" {
  value = digitalocean_droplet.docker3[*].ipv4_address
  description = "The public IP address of your Droplet application."
}
