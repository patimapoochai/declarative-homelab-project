# Building a declarative home lab using k3s, Ansible, Helm on NixOS and Rocky Linux
## What is this project?
This is the infrastructure code to build my home lab for running services like Prometheus, Grafana, Nextcloud, and more on k3s and Docker. View the full details of this project in [my blog post](https://dev.to/patimapoochai/building-a-declarative-home-lab-using-k3s-ansible-helm-on-nixos-and-rocky-linux-21l5).

## How are the services deployed?
This project is meant to be deployed to two or more hosts with one host running Rocky Linux 9 and one host running NixOS.

The Rock Linux host will be the primary server, and all of the Docker Compose-based services and the main K3s server will be running on this host. The Ansible scripts to install each service will expect that the target host will be running a Rocky Linux host and that the target host will be assigned the required Ansible inventory group.

For the NixOS host, there's only one Ansible script to deploy the Nix configuration to the machine because other configurations are managed by their own declarative configuration files. The `configuration.nix` file will set up the K3s binary in "agent" (worker node) mode and install the Prometheus node exporter.

## Infrastructure Overview
### OS layer
- Rocky Linux
- NixOS

### Container runtime and orchestration
- Kubernetes with K3s
- Docker Compose

### Ops tools
- Helm
- Ansible

### Services
- Prometheus
- Grafana
- Nextcloud
- Syncthing
- Heimdall
- Forgejo

## Installation
### Pre-installation
- Change the folder name of the folder `secrets-TEMPLATE/` to `secrets/`
- Replace the placeholder values inside `secrets/configuration.yml` (see `RockyLinux9/README.md` for details on each settings)

### Rocky Linux
- Install Rocky Linux on the first host using a live boot USB

#### Setup Rocky Linux
- Run the `RockyLinux9/setup-ansible-rocky9.yml` playbook for rhe Rocky Linux host
- Optional:  run the `RockyLinux9/optimize-rocky9.yml` playbook for to apply power-saving profiles

#### Setup Docker and K3s
- Run the `RockyLinux9/install-docker-rocky9.yml` to install Docker
- Run `k3s/setup-k3s-rocky9.yml` playbook to set up the K3s server on the Rocky Linux host
### Install Helm
- Run `k3s/install-helm-rocky9.yml` the playbook

### NixOS
- Install NixOS using a live boot USB
- Run the `NixOS/provision-k3s-nixos.yml` playbook for the NixOS host
 
### Other services
- Install other services by going into their directory and following the `README.md` instructions

## TODO
Future fixes and features:
- Storage server
- Backup and disaster recovery services
- Helm repository server
- Vulnerability management
