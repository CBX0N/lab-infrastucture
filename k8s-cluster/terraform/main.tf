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

resource "proxmox_virtual_environment_vm" "K8-Master" {
  name        = "K8-Master"
  description = "VM Running Kubernetes - Master Node"
  node_name   = "pve"
  clone {
    vm_id = 900
  }
  cpu {
    cores   = 2
    sockets = 1
    type    = "qemu64"
  }
  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
  agent {
    enabled = true
  }
  memory {
    dedicated = 4096
    floating  = 256
  }
}

resource "proxmox_virtual_environment_vm" "K8-Worker" {
  name        = "K8-Worker"
  description = "VM Running Kubernetes - Worker Node"
  node_name   = "pve"
  clone {
    vm_id = 900
  }
  cpu {
    cores   = 2
    sockets = 1
    type    = "qemu64"
  }
  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
  agent {
    enabled = true
  }
  memory {
    dedicated = 4096
    floating  = 256
  }
}

output "K8-Master_privateIp" {
  value = proxmox_virtual_environment_vm.K8-Master.ipv4_addresses[1]
}

output "K8-Worker_privateIp" {
  value = proxmox_virtual_environment_vm.K8-Worker.ipv4_addresses[1]
}