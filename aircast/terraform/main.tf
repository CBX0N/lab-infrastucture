terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.40.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_host.url
  api_token = var.proxmox_host.api_token
  insecure  = true
  tmp_dir   = "/var/tmp"
}

resource "proxmox_virtual_environment_vm" "AirConnect" {
  name = "AirConnect"
  description = "VM Running AirConnect - Air Play for Chromecast"
  node_name = "pve"
  clone {
    vm_id = 900
  }
  cpu {
    cores = 1
    sockets = 1
    type = "qemu64"
  }
  agent {
    enabled = true
  }
  memory {
    dedicated = 2048
    floating = 256
  }
}