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

## Upgrade notes

###  docker_privileged feature

A feature flag was added that conflicts with the values set in `extra_configs`:

```
TASK [riemers.gitlab-runner : Assemble new config.toml] *********************************************************************************************************************
fatal: [scientific-openstack-kayobe-gitlab-runner-0]: FAILED! => {"changed": false, "msg": "failed to validate: rc:1 error:Runtime platform                                  \u001b[0;m  arch\u001b[0;m=amd64 os\u001b[0;m=linux pid\u001b[0;m=1363176 revision\u001b[0;m=d540b510 version\u001b[0;m=15.9.1\nRunning in system-mode.                           \u001b[0;m \n                                                  \u001b[0;m \n\u001b[31;1mFATAL: toml: line 19 (last key \"runners.docker.privileged\"): Key 'runners.docker.privileged' has already been defined.\u001b[0;m \n"}
````

Examaning the config file:

```
    privileged = true
    "privileged" = true
    "tls_verify" = false
```

Solution: Remove conflicting option before running playbook again.

