variable "proxmox_password" {
  type    = string
  default = "0fa5166c-6def-4f2f-8547-0778bbd4c6bf"
}

variable "proxmox_username" {
  type    = string
  default = "packer@pam!packer-token-id"
}

variable "proxmox_url" {
  type    = string
  default = "https://192.168.0.230:8006/api2/json"
}

variable "proxmox_node" {
  type    = string
  default = "pve"
}