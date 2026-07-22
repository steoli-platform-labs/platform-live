# Development Environment

Terraform root module for the Development environment.

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
terraform plan -out=tfplan
terraform apply tfplan
```

Do not commit `backend.hcl`, `terraform.tfvars`, state files, or plan files.
