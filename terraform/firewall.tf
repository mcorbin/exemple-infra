
resource "exoscale_security_group" "example-infra-common" {
  name        = "example-infra-common"
  description = "Security group shared by all machines"
}

resource "exoscale_security_group_rule" "ssh_in" {
  security_group_id = exoscale_security_group.example-infra-common.id
  protocol          = "TCP"
  type              = "INGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 22
  end_port          = 22
}

resource "exoscale_security_group_rule" "http_out" {
  security_group_id = exoscale_security_group.example-infra-common.id
  protocol          = "TCP"
  type              = "EGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 80
  end_port          = 80
}

resource "exoscale_security_group_rule" "https_out" {
  security_group_id = exoscale_security_group.example-infra-common.id
  protocol          = "TCP"
  type              = "EGRESS"
  cidr              = "0.0.0.0/0"
  start_port        = 443
  end_port          = 443
}
