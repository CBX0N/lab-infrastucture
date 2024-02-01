######################################################
# Description: This file contains the variables used in the Terraform configuration.
# Path: terraform/variables.tf
##################### Cloudflare #####################
variable "cloudflare_api_token" {
  description = "value of the Cloudflare API token"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "value of the Cloudflare zone ID"
  type        = string
}

variable "dns_hostname" {
  description = "Hostname to configure dns records for"
  type        = string
}

variable "onprem_ip" {
  description = "value of OnPrem IP"
  type        = string
  default     = null
}

##################### Cloudflare #####################
variable "proxmox_api_token" {
  type    = string
  default = "packer@pam!packer-token-id=0fa5166c-6def-4f2f-8547-0778bbd4c6bf"
}

variable "proxmox_username" {
  type    = string
  default = "packer@pam!packer-token-id"
}

variable "proxmox_url" {
  type    = string
  default = "https://pve.cbxon.co.uk:8006/api2/json"
}

variable "proxmox_node" {
  type    = string
  default = "pve"
}