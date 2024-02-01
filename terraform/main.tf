terraform {
  required_providers {
    # cloudflare = {
    #   source  = "cloudflare/cloudflare"
    #   version = "4.0"
    # }
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.40.0"
    }
  }
  # cloud {
  #   organization = "cbxon"
  #   workspaces {
  #     name = "docker-stack"
  #   }
  # }
}

# provider "cloudflare" {
#   api_token = var.cloudflare_api_token
# }

provider "proxmox" {
  endpoint = var.proxmox_url
  api_token    = var.proxmox_api_token
  insecure = true
  tmp_dir  = "/var/tmp"
}


# module "cloudflare_record" {
#   source             = "./modules/cloudflare-records"
#   cloudflare_zone_id = var.cloudflare_zone_id
#   dns-records        = local.dns_records
# }

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

#resource "proxmox_virtual_environment_vm" "K8-Master" {
 # name = "K8-Master"
  #description = "VM Running Kubernetes - Master Node"
  #node_name = "pve"
  #clone {
   # vm_id = 900
  #}
 # cpu {
  #  cores = 2
   # sockets = 1
   # type = "qemu64"
 # }
 # network_device {
 #   bridge = "vmbr0"
 #   model = "virtio"
 # }
 # agent {
 #   enabled = true
 # }
 # memory {
 #   dedicated = 4096
 #   floating = 256
 # }
#}

#resource "proxmox_virtual_environment_vm" "K8-Worker" {
#  name = "K8-Worker"
#  description = "VM Running Kubernetes - Worker Node"
#  node_name = "pve"
#  clone {
#    vm_id = 900
#  }
#  cpu {
#    cores = 2
#    sockets = 1
#    type = "qemu64"
#  }
#  network_device {
#    bridge = "vmbr0"
#    model = "virtio"
#  }
#  agent {
#    enabled = true
#  }
#  memory {
#    dedicated = 4096
#    floating = 256
#  }
#}

#output "K8-Master_privateIp" {
#  value = proxmox_virtual_environment_vm.K8-Master.ipv4_addresses[1]
#}
#
#output "K8-Worker_privateIp" {
#  value = proxmox_virtual_environment_vm.K8-Worker.ipv4_addresses[1]
#}

