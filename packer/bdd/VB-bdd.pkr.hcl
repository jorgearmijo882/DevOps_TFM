packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "bdd" {
  iso_url              = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  iso_checksum         = "sha256:93bdab204067321ff131f560879db46bee3b994bf24836bb78538640f689e58f"
  vm_name              = "bdd-vm"
  guest_os_type        = "Ubuntu_64"
  ssh_username         = "packer"
  ssh_password         = "packer"
  ssh_wait_timeout     = "20m"
  shutdown_command     = "echo 'packer' | sudo -S shutdown -P now"
  disk_size            = 8000
  hard_drive_interface = "sata"
  output_directory     = "output"
}

build {
  sources = ["source.virtualbox-iso.bdd"]

  provisioner "file" {
    source      = "./provisioners/init.sql"
    destination = "/home/packer/init.sql"
  }

  provisioner "shell" {
    script = "./provisioners/install-db.sh"
  }
}