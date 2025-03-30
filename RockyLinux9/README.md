## Overview
Make sure you read the `README.md` in the root directory first.

## Configure the installation settings
Before running `setup-ansible-rocky9.yml`, set the following settings in the `secrets/configuration.yml` file:
- Set the SSH keypair password in `ansible_private_key_password`
- Use your username for your current machine for`localhost_username`
- Use the username you used while installing Rocky Linux via live USB boot in `rocky_remote_user`

## Installation
- Provision the host using a live installation USB
- Run the `setup-ansible-rocky9.yml` playbook to make the host managable by Ansible
- Run the `install-docker-rocky9.yml` playbook to install docker onto the host
- Optional: run the `optimize-rocky9.yml` to apply power-saving settings
