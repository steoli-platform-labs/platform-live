# Shared Infrastructure

Terraform root module for the shared AWS infrastructure used by the lab Kubernetes environments.

Full guides:

- Lab 03: `../../../docs/labs/lab03-aws-networking.md`
- Lab 04: `../../../docs/labs/lab04-amazon-eks.md`

## Commands

```bash
cp backend.hcl.example backend.hcl
cp terraform.tfvars.example terraform.tfvars
export TF_VAR_workspace_path="$WORKSPACE"
terraform init -backend-config=backend.hcl
terraform fmt
terraform validate
terraform plan
terraform apply
```

Do not commit `backend.hcl`, `terraform.tfvars`, state files, or `.terraform/`.
