#!/bin/bash

# Run Terraform output command to retrieve the public IP address
RUNNER_HOST=$(terraform output -raw runner_instance_public_ip)

# Generate Ansible inventory file
cat <<EOF > inventory.yml
all:
  hosts:
    runner:
      ansible_host: $RUNNER_HOST
EOF

# Run Ansible playbook with the dynamic inventory
ansible-playbook -i inventory.yml terra-playbook.yaml

# Clean up
rm inventory.yml
