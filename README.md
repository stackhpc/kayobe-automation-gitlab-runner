# Kayobe-automation gitlab runner

Ansible playbook to configure a gitlab runner.

## Usage

NOTE: All ansible commands are run from the ansible directory.

### Deploying runner

Run terraform to deploy a VM and generate the ansible inventory.

    terraform apply --var-file arcus.tfvars

### Initial registration

    ansible-playbook site.yml -e @config/vglab-runners.yml -e gitlab_runner_registration_token=token

### Re-configuration

    ansible-playbook site.yml -e @config/vglab-runners.yml

