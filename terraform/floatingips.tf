resource "openstack_networking_floatingip_v2" "fip" {
  pool = "Ext_Floating_IP"
}

resource "openstack_compute_floatingip_associate_v2" "fip_assoc" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.control-plane.id
}
