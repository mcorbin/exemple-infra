
resource "exoscale_instance_pool" "consul_worker" {
  name = "consul-workers"
  description = "consul workers instance pools"
  template_id  = "${data.exoscale_compute_template.debian.id}"
  service_offering = "small"
  size = 5
  user_data = data.template_cloudinit_config.config.rendered
  key_pair = exoscale_ssh_keypair.example-infra-perso.name
  zone = var.exoscale_zone

  security_group_ids = [exoscale_security_group.example-infra-common.id]
  network_ids = [exoscale_network.example-infra.id]

  provisioner "local-exec" {
    command = "./pool-tag.sh ${exoscale_instance_pool.consul_worker.id} consul_workers"
  }

}
