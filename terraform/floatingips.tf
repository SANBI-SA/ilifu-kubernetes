resource "openstack_networking_floatingip_v2" "fip" {
  pool = "Ext_Floating_IP"
}

resource "openstack_compute_floatingip_associate_v2" "fip_assoc" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.control-plane.id

  # Copy Private Key to Ansible node
  provisioner "file" {

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = openstack_networking_floatingip_v2.fip.address
      private_key = "${file("../ilifu.pem")}"
    }

    source = "../ilifu.pem"
    destination = "/home/ubuntu/ilifu.pem"
  }

  # Copy Ansible directory to target (TESTING, SHOULD BE GIT FOR PROD)
  provisioner "file" {

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = openstack_networking_floatingip_v2.fip.address
      private_key = "${file("../ilifu.pem")}"
    }

    source = "../ansible"
    destination = "/home/ubuntu/ilifu-kubernetes-ansible"
  }
  
  # Copy OpenStack App Creds to Ansible node
  provisioner "file" {

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = openstack_networking_floatingip_v2.fip.address
      private_key = "${file("../ilifu.pem")}"
    }

    source = "../app-cred.sh"
    destination = "/home/ubuntu/app-cred.sh"
  }

  # Copy run script to Ansible node
  provisioner "file" {

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = openstack_networking_floatingip_v2.fip.address
      private_key = "${file("../ilifu.pem")}"
    }

    source = "./k8s_ansible.sh"
    destination = "/home/ubuntu/k8s_ansible.sh"
  }

  # Execute run script for Ansible
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = openstack_networking_floatingip_v2.fip.address
      private_key = "${file("../ilifu.pem")}"
    }

    inline = [
      "chmod +x /home/ubuntu/k8s_ansible.sh",
      "/home/ubuntu/k8s_ansible.sh"
    ]
  }
}
