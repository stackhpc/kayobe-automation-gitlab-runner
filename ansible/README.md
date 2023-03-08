# Kayobe-automation gitlab runner

Ansible playbook to configure a gitlab runner.

## Usage

### Initial registration

    ansible-playbook site.yml -e @config/vglab-runners.yml -e gitlab_runner_registration_token=token

### Re-configuration

    ansible-playbook site.yml -e @config/vglab-runners.yml

