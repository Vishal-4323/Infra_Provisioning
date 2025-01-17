variable "security_group_id" {
  description = "id of the security group"
}

variable "cidr_ipv4" {
  description = "ipv4 cidr block"
}

variable "from_port" {
  description = "allowing port"
}

variable "to_port" {
  description = "destination port"
}

variable "ip_protocol" {
  description = "ip protocol"
}