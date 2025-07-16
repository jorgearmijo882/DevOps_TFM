terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "bdd" {
  name      = var.vm_name
  image     = "${path.module}/../../packer/bdd/output/bdd-vm.vdi"
  cpus      = 1
  memory    = 1024

  network_adapter {
    type           = "nat"
    nat_dns_proxy  = true
    nat_redirects = [
      {
        host_port      = 5432
        guest_port     = 5432
        protocol       = "tcp"
      }
    ]
  }
}