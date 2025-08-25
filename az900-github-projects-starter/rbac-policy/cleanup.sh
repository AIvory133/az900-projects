#!/usr/bin/env bash
set -euo pipefail
POLICY_NAME="${POLICY_NAME:-allow-small-vm-sizes}"
# Remove assignments (best-effort) and definition
set +e
az policy assignment delete --name "$POLICY_NAME" >/dev/null 2>&1
set -e
az policy definition delete --name "$POLICY_NAME" 1>/dev/null || true
echo "Policy cleaned up."
