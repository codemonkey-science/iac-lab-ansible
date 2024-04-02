# Infrastructure as Code (IaC) Lab with Ansible

Ansible configuration for the lab.

[![Ansible CI/CD](https://github.com/codemonkey-science/iac-lab-ansible/actions/workflows/main.yml/badge.svg)](https://github.com/codemonkey-science/iac-lab-ansible/actions/workflows/main.yml)

![Ansible Logo](docs/images/ansible.png)

This repository contains Ansible playbooks and roles for setting up and managing a lab environment. The configuration includes various services such as Wazuh, Graylog, Keycloak, OpenCTI, MISP, and Uptime Kuma.

## Overview

The `src` directory contains the main Ansible configuration, including the `ansible.cfg` file, the `inventory` directory, and the `roles` directory. The `roles` directory contains Ansible roles for each service, and the `inventory` directory contains the hosts and group variables for the Ansible playbooks.

## Prerequisites

Before you can use the playbooks and roles in this repository, you need to install Ansible and some other tools on your local machine.

### Install Ansible

On Ubuntu, you can install Ansible with `apt`:

```sh
sudo apt update
sudo apt install ansible
```

On other operating systems, see the [Ansible installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

### Install Docker and Docker Compose

Some of the roles in this repository require Docker and Docker Compose. You can install them with the following commands:

```sh
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Usage

To use the playbooks and roles in this repository, you need to configure your inventory and run the `site.yml` playbook:

```sh
ansible-playbook src/site.yml
```

Please refer to the individual roles for more detailed instructions and role-specific variables.
