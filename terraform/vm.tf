data "openstack_images_image_v2" "image" {
  name        = "CentOS-stream8"
  most_recent = true
}

resource "openstack_compute_instance_v2" "scientific_openstack_runner" {
  name            = "scientific-openstack-gitlab-runner"
  image_name      = "CentOS-stream8"
  flavor_name     = "general.v1.medium"
  key_pair        = "stackhpc-will"
  config_drive    = true
  network {
    name = "stackhpc-ipv4-geneve"
  }
  block_device {
    uuid                  = data.openstack_images_image_v2.image.id
    source_type           = "image"
    volume_size           = 200
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

}
