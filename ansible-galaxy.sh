#!/bin/bash

script_dir=$(dirname $(realpath ${BASH_SOURCE[0]:-${(%):-%x}}))

ansible-galaxy role install -r "$script_dir/requirements.yml" -p "$script_dir/ansible/roles"
ansible-galaxy collection install -r "$script_dir/requirements.yml" -p "$script_dir/ansible/collections"
