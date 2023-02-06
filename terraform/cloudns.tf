resource "cloudns_dns_record" "k8s-record" {
  provider = cloudns
  name  = "k8s-controller"
  zone  = "sanbi.ac.za"
  type  = "A"
  value = openstack_networking_floatingip_v2.fip.address
  ttl   = "600"
}