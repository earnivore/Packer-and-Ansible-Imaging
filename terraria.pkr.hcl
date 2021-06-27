# terraria.pkr.hcl
variable "project-id" {
  type = string
}
source "googlecompute" "ubuntu-1804" {
  project_id   = var.project-id
  source_image = "ubuntu-1804-bionic-v20210623"
  ssh_username = "packer"
  zone         = "us-east1-b"
  machine_type = "e2-medium"
}

build {
  sources = ["sources.googlecompute.ubuntu-1804"]
  provisioner "ansible" {
    playbook_file = "./terraria-playbook.yml"
  }
}

