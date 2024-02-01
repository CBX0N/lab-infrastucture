######################################################
# Description: This file contains the variables used in the Terraform configuration.
# Path: terraform/variables.tf
##################### Proxmox #####################
variable "proxmox_host" {
  type = object({
    node = string
    username = string
    url = string
    api_token = string
  })
}