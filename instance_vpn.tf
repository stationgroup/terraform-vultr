// Create a Vultr virtual machine.
resource "vultr_instance" "instance-vpn" {
  name              = "ubuntu18-vpn"
  region_id         = "${data.vultr_region.silicon_valley.id}"
  plan_id           = "${data.vultr_plan.vc2-5.id}"
  os_id             = "${data.vultr_os.ubuntu18.id}"
  ssh_key_ids       = ["${data.vultr_ssh_key.primary.id}"]
  hostname          = "instance-vpn"
  tag               = "ubuntu18"
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
}

# Display public IP
output ip_addresses {
  value = "${concat(vultr_instance.instance-vpn.*.ipv4_address, list(vultr_instance.instance-vpn.ipv4_address))}"
}

# Create a new DNS record.
resource "vultr_dns_record" "example-vpn" {
  domain = "${vultr_dns_domain.example.id}"
  name   = "vpn"
  type   = "A"
  data   = "${vultr_instance.instance-vpn.ipv4_address}"
  ttl    = 300
}