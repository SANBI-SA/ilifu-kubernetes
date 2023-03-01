resource "openstack_compute_instance_v2" "control-plane" {

  count           = 3
  
  name            = "k8s-control-${count.index}"
  image_id        = var.base_os_image
  flavor_id       = var.compute_flavour_control-plane
  key_pair        = openstack_compute_keypair_v2.k8s-keypair.name
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.k8s_control-plane.name,
    openstack_networking_secgroup_v2.k8s_cni-plane.name,
    "server_secgroup"
  ]

  network {
    name = "SANBI-net"
  }

  metadata = {
        ansible_group_name = "kube_control_plane,etcd"
        ansible_etcd_member_name = "etcd${count.index}"
  }

  depends_on = [openstack_compute_instance_v2.worker-plane]
}

resource "openstack_compute_instance_v2" "worker-plane" {

  count           = 2
  name            = "k8s-worker-${count.index}"
  image_id        = var.base_os_image
  flavor_id       = var.compute_flavour_worker-plane
  key_pair        = openstack_compute_keypair_v2.k8s-keypair.name
  security_groups = [
    "default",
    openstack_networking_secgroup_v2.k8s_worker-plane.name,
    openstack_networking_secgroup_v2.k8s_cni-plane.name,
    "server_secgroup"
    ]

  network {
    name = "SANBI-net"
  }

  metadata = {
        ansible_group_name = "kube_node"
  }

}