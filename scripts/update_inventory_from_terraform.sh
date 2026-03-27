#!/usr/bin/env bash
set -euo pipefail

TERRAFORM_DIR="${1:-$HOME/projekty/terraform-hetzner}"
INVENTORY_FILE="${2:-inventory}"

APP_IP="$(terraform -chdir="$TERRAFORM_DIR" output -raw app_server_ip)"
MONITORING_IP="$(terraform -chdir="$TERRAFORM_DIR" output -raw monitoring_server_ip)"

cat > "$INVENTORY_FILE" <<EOF
[app]
${APP_IP} ansible_user=root

[monitoring]
${MONITORING_IP} ansible_user=root
EOF

echo "Inventory updated:"
cat "$INVENTORY_FILE"
