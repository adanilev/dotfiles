#!/usr/bin/env bash

set -euxo pipefail

cd ansible
ansible-playbook main.yml -e "local_username=$(id -un)" -K

