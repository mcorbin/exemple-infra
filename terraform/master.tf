
resource "exoscale_compute" "consul_master" {
  count = 3

  display_name = "consul-master-${count.index}"
  template_id  = "${data.exoscale_compute_template.debian.id}"

  zone = var.exoscale_zone

  size            = "Tiny"
  disk_size       = 20
  key_pair        = exoscale_ssh_keypair.example-infra-perso.name
  security_groups = [exoscale_security_group.example-infra-common.name]
  tags = {
    ansible_groups = "consul-master"
  }

  user_data = data.template_cloudinit_config.config.rendered
}

resource "exoscale_nic" "eth_consul_master" {
  count = length(exoscale_compute.consul_master)

  compute_id = exoscale_compute.consul_master.*.id[count.index]
  network_id = exoscale_network.example-infra.id
}

