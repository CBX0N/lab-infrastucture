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

resource "proxmox_virtual_environment_vm" "core-cb-ns" {
  name = "core-cb-ns1"
  description = "VM Running BIND9 - DNS Service"
  node_name = var.proxmox_host.node
  clone {
    vm_id = 900
    full = true
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

  tags = [ "core-services", "terraform", "dns", "production","ubuntu-2204" ]
}

output "core-cb-ns_privateIp" {
  value = proxmox_virtual_environment_vm.core-cb-ns.ipv4_addresses[1]
}