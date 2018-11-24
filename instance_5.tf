# Create a Vultr virtual machine.
resource "vultr_instance" "instance-5" {
  name              = "ubuntu16"
  region_id         = "${data.vultr_region.silicon_valley.id}"
  plan_id           = "${data.vultr_plan.vc2-5.id}"
  os_id             = "${data.vultr_os.ubuntu16.id}"
  ssh_key_ids       = ["${data.vultr_ssh_key.primary.id}"]
  hostname          = "instance-5"
  tag               = "ubuntu16"
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
}
