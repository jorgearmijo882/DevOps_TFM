terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "backend" {
  name      = var.vm_name
  image     = "${path.module}/../../packer/backend/output/backend-vm.vdi"
  cpus      = 2
  memory    = 2048

  network_adapter {
    type           = "nat"
    nat_dns_proxy  = true
    nat_redirects = [
      {
        host_port      = 8081
        guest_port     = 8080
        protocol       = "tcp"
      }
    ]
  }
}