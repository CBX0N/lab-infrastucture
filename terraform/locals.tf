locals {
  dns_records = {
    "pve" = {
      name  = "pve"
      type  = "A"
      value = var.onprem_ip
    },
    # "root" = {
    #   name  = "@"
    #   type  = "A"
    #   value = var.onprem_ip
    # },
    # "traefik-CNAME" = {
    #   name  = "traefik"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Quantum-CNAME" = {
    #   name  = "Quantum"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Genesis-CNAME" = {
    #   name  = "Genesis"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Paragon-CNAME" = {
    #   name  = "Paragon"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Titan-CNAME" = {
    #   name  = "Titan"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Rogue-CNAME" = {
    #   name  = "Rogue"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Odyssey-CNAME" = {
    #   name  = "Odyssey"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # },
    # "Vertex-CNAME" = {
    #   name  = "Vertex"
    #   type  = "CNAME"
    #   value = var.dns_hostname
    # }
  }
}