locals {
   gitlab_runner_hosts = [{"name": openstack_compute_instance_v2.scientific_openstack_runner.name, "ansible_host": openstack_compute_instance_v2.scientific_openstack_runner.access_ip_v4, ansible_user: "centos"}]
}


resource "local_file" "hosts" {
  content = templatefile("${path.module}/templates/ansible-inventory/hosts.tpl",
    {
      "group_name": "gitlab_runners"
      "hosts" : local.gitlab_runner_hosts,
    },
  )
  filename = "../ansible/inventory/runner"
}
