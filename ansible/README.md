# Kayobe-automation gitlab runner

Ansible playbook to configure a gitlab runner.

## Usage

    ansible-playbook site.yml -e @config/vglab-runners.yml -e gitlab_runner_registration_token=token
