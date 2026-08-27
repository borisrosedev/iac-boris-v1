.PHONY: create.inv

SCRIPT_DIR := $(CURDIR)/chore/utils

create.inv:
	@cd $(SCRIPT_DIR) && ./create_inventory.sh $(ENV) $(TF_ENV_DIR) vm_public_ip
