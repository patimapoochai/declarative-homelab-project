## Overview
Make sure you read the `README.md` in the root directory first.

## Configure the installation settings
Before running `provision-k3s-nixos.yml`, set the following settings in the `secrets/configuration.yml` file:
- Use the IP address of the K3s server running on the Rocky Linux 9 as the value for the `k3s.k3s-server-ip` settings

## Installation
- Provision the host using a live installation USB
- Run the `provision-k3s-nixos.yml` playbook
