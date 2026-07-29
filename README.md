# platform-live

Shared Terraform configurations for the AWS Platform Labs project.

## Purpose

This repository composes reusable modules from `platform-modules` into deployable shared lab infrastructure. It stores no credentials and no Terraform state.

## Repository Structure

```text
environments/
└── shared/
```

## Lab 03

The shared root module provisions the VPC across two Availability Zones with public and private subnets and a cost-optimized single NAT Gateway.

Open `environments/shared/README.md` for commands.

## Validation

```bash
./scripts/validate.sh
```

## Security Considerations

- Remote state is stored in the encrypted S3 backend created in Lab 02.
- Private workloads do not receive public IP addresses.
- Secrets and account-specific values are not committed.

## Related Repositories

- `platform-modules`
- `platform-bootstrap`
- `docs`
