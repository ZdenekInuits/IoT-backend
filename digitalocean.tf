terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "api_token" {
  default = ""
}

provider "digitalocean" {
  token = var.api_token
}

resource "digitalocean_droplet" "docker1" {
  image      = "centos-7-x64"
  name       = "docker1"
  region     = "fra1"
  size       = "s-1vcpu-1gb"
  monitoring = false
  ipv6       = false
  user_data  = file("terraform-droplet.yaml")
  ssh_keys   = ["32889730"]
  tags       = ["docker"]
}

resource "digitalocean_droplet" "docker2" {
  image      = "centos-7-x64"
  name       = "docker2"
  region     = "fra1"
  size       = "s-1vcpu-1gb"
  monitoring = false
  ipv6       = false
  user_data  = file("terraform-droplet.yaml")
  ssh_keys   = ["32889730"]
  tags       = ["docker"]
}

resource "digitalocean_droplet" "docker3" {
  image      = "centos-7-x64"
  name       = "docker3"
  region     = "fra1"
  size       = "s-1vcpu-1gb"
  monitoring = false
  ipv6       = false
  user_data  = file("terraform-droplet.yaml")
  ssh_keys   = ["32889730"]
  tags       = ["docker"]
}
