
resource "exoscale_compute" "frontend" {
  count = 2

  display_name = "frontend-${count.index}"
  template_id  = "${data.exoscale_compute_template.debian.id}"

  zone = var.exoscale_zone

  size            = "Tiny"
  disk_size       = 20
  key_pair        = exoscale_ssh_keypair.example-infra-perso.name
  security_groups = [exoscale_security_group.example-infra-common.name]
  tags = {
    ansible_groups = "frontend"
  }

  user_data = data.template_cloudinit_config.config.rendered
}

resource "exoscale_nic" "eth_frontend" {
  count = length(exoscale_compute.frontend)

  compute_id = exoscale_compute.frontend.*.id[count.index]
  network_id = exoscale_network.example-infra.id
}
