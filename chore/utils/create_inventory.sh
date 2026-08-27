#!/bin/bash
set -euo pipefail
source "$(dirname ${BASH_SOURCE[0]})/display.sh"

create_inventory(){
  local env=${1:-dev}
  local path="../../infra/envs/$env"
  local current_dir=$(dirname "${BASH_SOURCE[0]}")
  local tf_env_dir=${2:-"$current_dir/$path"}

  display_msg "$tf_env_dir" info


  vm_public_ip=$(terraform -chdir=$tf_env_dir output $3 | tr -d \")

  if [ -z "$vm_public_ip" ]; then
    display_msg "no ip output" error
    exit 1
  else
    display_msg "✅ ip output" success
  fi


  local root_dir="$current_dir/../../"
  if [ ! -d "$root_dir/ansible" ]; then
    mkdir -p $root_dir/ansible
  else
  {
    echo "[dev]"
    echo -e "$vm_public_ip ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/terraform-ipssi\n"
  } > $root_dir/ansible/inventory.ini

  ansible all -i $root_dir/ansible/inventory.ini -m ping
  fi
}

create_inventory "$1" "$2" "$3"
