data "openstack_images_image_v2" "image" {
    name        = var.image
    most_recent = true
}

resource "openstack_compute_instance_v2" "scientific_openstack_runner" {
  name            = "scientific-openstack-gitlab-runner-0"
  image_id      = data.openstack_images_image_v2.image.id
  flavor_name     = var.flavor
  key_pair        = var.keypair
  config_drive    = true
  network {
    name = var.network
  }
  dynamic "block_device" {
      for_each = var.boot_from_volume ? ["create"] : []
      content {
        uuid                  = data.openstack_images_image_v2.image.id
        source_type           = "image"
        volume_size           = 200
        boot_index            = 0
        destination_type      = "volume"
        delete_on_termination = true
      }
  }

}
