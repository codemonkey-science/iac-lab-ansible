# Ansible Configuration for IaC Lab

This directory contains the main Ansible configuration for the Infrastructure as Code (IaC) Lab. It includes the `ansible.cfg` file, the `inventory` directory, and the `roles` directory.

## Roles

Each role in the `roles` directory is responsible for setting up and managing a specific service in the lab environment.

### [Common](src/roles/common)

The `common` role contains tasks that are common to all hosts, such as setting up Docker and Docker Compose, configuring SSH, and updating the system.

### [Graylog](src/roles/graylog)

The `graylog` role sets up the Graylog service, which is a centralized log management solution.

### [Graylog Forwarder](src/roles/graylog-forwarder)

The `graylog-forwarder` role configures the Graylog Forwarder, which forwards logs to the Graylog service.

### [Authentik](src/roles/authentik)

The `authentik` role sets up the Authenik service, which is an open-source identity and access management solution.

### [MISP](src/roles/misp)

The `misp` role sets up the MISP service, which is an open-source threat intelligence platform.

### [OpenCTI](src/roles/opencti)

The `opencti` role sets up the OpenCTI service, which is an open-source cyber threat intelligence platform.

### [Uptime Kuma](src/roles/uptime-kuma)

The `uptime-kuma` role sets up the Uptime Kuma service, which is a self-hosted monitoring tool.

### [Wazuh](src/roles/wazuh)

The `wazuh` role sets up the Wazuh service, which is a security detection, visibility, and compliance open-source project.

### [Wazuh Agent](src/roles/wazuh-agent)

The `wazuh-agent` role sets up the Wazuh Agent on the hosts, which collects and sends information to the Wazuh server.

## Inventory

The `inventory` directory contains the hosts and group variables for the Ansible playbooks. The `hosts` file lists all the hosts that Ansible will manage, and the `group_vars` directory contains variables that are specific to each group of hosts.

## Running the Playbooks

To use the playbooks and roles in this repository, you need to configure your inventory and run the `site.yml` playbook:

```sh
ansible-playbook site.yml