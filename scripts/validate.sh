#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
stack_dir="${repo_root}/environments/dev"

terraform fmt -check -recursive "${repo_root}"
terraform -chdir="${stack_dir}" init -backend=false
terraform -chdir="${stack_dir}" validate

echo "platform-live validation passed"
