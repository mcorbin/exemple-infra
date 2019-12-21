data "exoscale_compute_template" "debian" {
  zone = var.exoscale_zone
  name = "Debian 10 1574286847"
  filter = "mine"
}
