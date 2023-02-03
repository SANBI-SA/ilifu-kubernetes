output "k8s_master-fip" {
  value = openstack_networking_floatingip_v2.fip.address
}
