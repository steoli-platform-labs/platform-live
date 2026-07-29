#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
stack_dir="${repo_root}/environments/shared"

if [ -z "${TF_DATA_DIR:-}" ]; then
  export TF_DATA_DIR
  TF_DATA_DIR="$(mktemp -d)"
  trap 'rm -rf "$TF_DATA_DIR"' EXIT
fi

terraform fmt -check -recursive "${repo_root}"
terraform -chdir="${stack_dir}" init -backend=false -lockfile=readonly
terraform -chdir="${stack_dir}" validate

echo "platform-live validation passed"
