packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "ubuntu-2204-base" {
  node                     = "${var.proxmox_node}"
  username                 = "${var.proxmox_username}"
  token                    = "${var.proxmox_password}"
  proxmox_url              = "${var.proxmox_url}"
  insecure_skip_tls_verify = true
  template_name            = "ubuntu-2204-base"
  template_description     = "Base Template for Ubuntu Server 22.04.3"
  http_directory           = "http"
  iso_file                 = "local:iso/ubuntu-22.04.3-live-server-amd64.iso"
  iso_storage_pool         = "local"
  unmount_iso              = true
  vm_id                    = 900
  memory                   = 4096
  os                       = "l26"
  qemu_agent               = true

  disks {
    disk_size    = "20G"
    storage_pool = "fast-data"
    type         = "scsi"
  }

  network_adapters {
    bridge   = "vmbr0"
    model    = "virtio"
    firewall = "false"
  }

  boot_command = ["c<wait>", "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/' ip=dhcp", "<wait><enter><wait>", "initrd /casper/initrd", "<wait><enter><wait>", "boot", "<enter>"]
  boot_wait    = "10s"
  ssh_username = "packer"
  ssh_password = "packer"
  ssh_timeout  = "20m"
}