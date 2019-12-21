resource "exoscale_network" "example-infra" {
  name             = "example-infra"
  display_text     = "Network for the example-infra project"
  zone             = var.exoscale_zone
  start_ip = "10.240.0.1"
  end_ip = "10.240.0.220"
  netmask = "255.255.255.0"
}
