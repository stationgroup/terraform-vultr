# Create a new firewall group.
resource "vultr_firewall_group" "ssh-mumble" {
  description = "example group"
}

# SSH
# Add a firewall rule to the group allowing SSH access.
resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}

# PING
# Add a firewall rule to the group allowing ICMP.
resource "vultr_firewall_rule" "icmp" {
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "icmp"
}

# MUMBLE TCP
resource "vultr_firewall_rule" "mumble-tcp" {
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 64738
  to_port           = 64738
}

# MUMBLE UDP
resource "vultr_firewall_rule" "mumble-udp" {
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "udp"
  from_port         = 64738
  to_port           = 64738
}
