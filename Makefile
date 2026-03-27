inventory:
	./scripts/update_inventory_from_terraform.sh

ping: inventory
	ansible all -m ping

deploy: inventory
	ansible-playbook playbook.yml
