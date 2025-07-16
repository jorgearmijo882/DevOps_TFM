terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "frontend" {
  name      = var.vm_name
  image     = "${path.module}/../packer/output/ubuntu-frontend.vdi"
  cpus      = 1
  memory    = 1024

  network_adapter {
    type           = "nat"
    nat_dns_proxy  = true
    nat_redirects = [
      {
        host_port      = 8080
        guest_port     = 80
        protocol       = "tcp"
      }
    ]
  }
}