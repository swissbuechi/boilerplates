# Installation

<https://github.com/swissbuechi/tools/blob/main/linux/apt/ansible.md>

# Setup

## Hosts

`sudo nano /etc/ansible/hosts`

# Test

`ansible all -m ping`

# Commands
##Custom Command
```shell
ansible <host> -m shell -a "<command>" -b #Became no Promt
```
## Playbooks
```shell
ansible-playbook <playbook.yml> -K #Become with Promt
```