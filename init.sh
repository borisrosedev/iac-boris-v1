#!/bin/bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/chores/utils/colors.sh"

ENV=dev
display_msg "=============================="
display_msg "ENV: $dev" info
display_msg "=============================="

# ============= GIT TOOLS =================
if [ -f ".gitignore" ] && [ -f ".gitattributes" ]; then
    display_msg ".gitingore & .gitattributes created" success
else
    touch .gitignore .gitattributes
    echo -e "\n.env\n*.tfvars\n*tfvars*\n*.tfstate\n*tfplan\n*tfplan*\n.terraform\n.ansible\n" >> .gitignore
fi
# ============= TF TOOLS =================
if [ -f ".tflint.hcl" ]; then
    display_msg "✅ .tflint.hcl created" success
else
    touch .tflint.hcl
fi

# ============= COMMON TOOLS =================

if [ -f "Makefile" ]; then
    display_msg "✅ Makefile created" success
else
    touch Makefile
fi

if [ ! -d "make" ]
then
    mkdir make
else
    display_msg "✅ make dir created" success
fi
touch make/common.mk make/tf.mk make/ansi.mk
touch .pre-commit-config.yaml
touch .editorconfig
touch checkmake.ini
# ============ INFRA BOILERPLATE ==============
# ========== ENVS ==========================
mkdir -p infra/envs/${ENV}
touch infra/envs/${ENV}/main.tf \
    infra/envs/${ENV}/outputs.tf \
    infra/envs/${ENV}/variables.tf \
    infra/envs/${ENV}/dev.auto.tfvars \
    infra/envs/${ENV}/versions.tf \
    infra/envs/${ENV}/providers.tf
# ========== MODULES ==========================

mkdir -p infra/modules/subnet || true
mkdir -p infra/modules/security_group || true
mkdir -p infra/modules/compute || true

# ===========================================
folders=(infra/modules/subnet infra/modules/security_group infra/modules/compute)
for f in "${folders[@]}"; do
    touch "$f/main.tf" "$f/variables.tf" "$f/versions.tf" "$f/outputs.tf"
done
