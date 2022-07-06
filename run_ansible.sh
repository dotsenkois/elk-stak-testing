#!/bin/bash
ansible-galaxy install -r playbook/requirements.yml --force
ANSIBLE_FORCE_COLOR=1 ansible-playbook -i playbook/inventory/prod/hosts.yml playbook/site.yml

