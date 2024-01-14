# output "random_name_1" {
#     value = random_id.server1.b64_std
# }
# output "random_name_2" {
#     value = random_id.server2.b64_std
# }
# output "random_name_3" {
#     value = random_id.server3.b64_std
# }
output "server_id" {
    value = openstack_compute_instance_v2.ubuntu_server.id
}