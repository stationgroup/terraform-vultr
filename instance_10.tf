# Create a Vultr virtual machine.
resource "vultr_instance" "instance-10" {
  name              = "ubuntu-18"
  region_id         = "${data.vultr_region.silicon_valley.id}"
  plan_id           = "${data.vultr_plan.vc2-10.id}"
  os_id             = "${data.vultr_os.ubuntu18.id}"
  ssh_key_ids       = ["${data.vultr_ssh_key.primary.id}"]
  hostname          = "instance-10"
  tag               = "ubuntu-18"
  firewall_group_id = "${vultr_firewall_group.ssh-mumble.id}"
}
