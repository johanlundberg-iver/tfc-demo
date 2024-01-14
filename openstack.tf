resource "openstack_networking_network_v2" "vm_net" {
    name = "tfc_net"
    admin_state_up = true
}
resource "openstack_networking_subnet_v2" "vm_subnet" {
    name = "tfc_subnet"
    network_id = openstack_networking_network_v2.vm_net.id
    cidr = "10.0.100.0/24"
    ip_version = 4
}

resource "openstack_compute_instance_v2" "ubuntu_server" {
  name = "tfc-demo-server"
  image_id = data.openstack_images_image_v2.ubuntu_2204.id
  flavor_id = data.openstack_compute_flavor_v2.small.id
  key_pair = "johan"
  security_groups = ["default"]
  network {
    name = openstack_networking_network_v2.vm_net.id
  }
}




data "openstack_images_image_v2" "ubuntu_2204" {
    name = "Ubuntu 22.04 (Jammy Jellyfish) (20220423)"
    most_recent = true    
}
data openstack_compute_flavor_v2 "small" {
    name = "2 CPU 4 GB Compute v1"

}