resource "aws_vpc_security_group_egress_rule" "sg_ob_rule" {
  security_group_id = var.security_group_id
  cidr_ipv4 = var.cidr_ipv4
  ip_protocol = var.ip_protocol
}