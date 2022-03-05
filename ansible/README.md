# Installation

<https://github.com/swissbuechi/tools/blob/main/linux/apt/ansible.md>

# Setup

## Hosts

`sudo nano /etc/ansible/hosts`

# Test

`ansible all -m ping`

# Commands
## Playbooks
```shell
ansible-playbook <playbook.yml> -K #Become
```