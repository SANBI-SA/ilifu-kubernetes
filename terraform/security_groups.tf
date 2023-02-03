resource "openstack_networking_secgroup_v2" "k8s_control-plane" {
    name        = "k8s_control-plane"
}

resource "openstack_networking_secgroup_v2" "k8s_cni-plane" {
    name        = "k8s_cni-plane"
}

resource "openstack_networking_secgroup_v2" "k8s_worker-plane" {
    name        = "k8s_worker-plane"
}

### control plane rules

resource "openstack_networking_secgroup_rule_v2" "k8s_control-plane" {

    for_each          = {for item in [
        {"dir": "egress", "ether": "IPv4", "proto": "tcp", "port_min": 0, "port_max": 0, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 2379, "port_max": 2380, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 6443, "port_max": 6443, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 10250, "port_max": 10250, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 10257, "port_max": 10257, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 10259, "port_max": 10259, }
        ]: item.port_min => item}

    direction         = each.value.dir
    ethertype         = each.value.ether
    protocol          = each.value.proto
    port_range_min    = each.value.port_min
    port_range_max    = each.value.port_max
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.k8s_control-plane.id}"
}

### cni rules

resource "openstack_networking_secgroup_rule_v2" "k8s_cni-plane" {

    for_each          = {for item in [
        {"id": 0, "dir": "egress", "ether": "IPv4", "proto": "tcp", "port_min": 0, "port_max": 0, },
        {"id": 1, "dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 179, "port_max": 179, },
        {"id": 2, "dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 2379, "port_max": 2379, },
        {"id": 3, "dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 4789, "port_max": 4789, },
        {"id": 4, "dir": "ingress", "ether": "IPv4", "proto": "udp", "port_min": 4789, "port_max": 4789, }
        ]: item.id => item}

    direction         = each.value.dir
    ethertype         = each.value.ether
    protocol          = each.value.proto
    port_range_min    = each.value.port_min
    port_range_max    = each.value.port_max
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.k8s_cni-plane.id}"
}

### worker rules

resource "openstack_networking_secgroup_rule_v2" "k8s_worker-plane" {

    for_each          = {for item in [
        {"dir": "egress", "ether": "IPv4", "proto": "tcp", "port_min": 0, "port_max": 0, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 10250, "port_max": 10250, },
        {"dir": "ingress", "ether": "IPv4", "proto": "tcp", "port_min": 30000, "port_max": 32767, },
        ]: item.port_min => item}

    direction         = each.value.dir
    ethertype         = each.value.ether
    protocol          = each.value.proto
    port_range_min    = each.value.port_min
    port_range_max    = each.value.port_max
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = "${openstack_networking_secgroup_v2.k8s_worker-plane.id}"
}