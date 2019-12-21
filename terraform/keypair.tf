resource "exoscale_ssh_keypair" "example-infra-perso" {
  name       = "example-infra-perso"
  public_key = file(var.ssh_public_key_path)
}
