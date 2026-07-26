output "aws_account_id" {
  description = "AWS account ID where the Development environment is deployed."
  value       = data.aws_caller_identity.current.account_id
}

output "availability_zones" {
  description = "Availability Zones used by the Development environment."
  value       = local.availability_zones
}

output "vpc_id" {
  description = "ID of the Development VPC."
  value       = module.network.vpc_id
}

output "vpc_cidr_block" {
  description = "Primary CIDR block of the Development VPC."
  value       = module.network.vpc_cidr_block
}

output "vpc_secondary_cidr_blocks" {
  description = "Secondary CIDR blocks associated with the Development VPC."
  value       = module.network.vpc_secondary_cidr_blocks
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of all private subnets."
  value       = module.network.private_subnet_ids
}

output "platform_private_subnet_ids" {
  description = "IDs of the private subnets allocated from the primary VPC CIDR."
  value       = local.platform_private_subnet_ids
}

output "eks_private_subnet_ids" {
  description = "IDs of the optional EKS-ready private subnets allocated after the platform private subnets."
  value       = local.eks_private_subnet_ids
}

output "nat_gateway_ids" {
  description = "IDs of the NAT Gateways."
  value       = module.network.nat_gateway_ids
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = module.network.internet_gateway_id
}

output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = try(module.eks[0].cluster_name, null)
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS cluster."
  value       = try(module.eks[0].cluster_endpoint, null)
}

output "oidc_provider_arn" {
  description = "ARN of the EKS OIDC provider."
  value       = try(module.eks[0].oidc_provider_arn, null)
}

output "karpenter_controller_role_arn" {
  description = "IAM role ARN associated with the Karpenter controller ServiceAccount."
  value       = try(module.eks[0].karpenter_controller_role_arn, null)
}

output "karpenter_node_role_name" {
  description = "IAM role name used by Karpenter-created worker nodes."
  value       = try(module.eks[0].karpenter_node_role_name, null)
}
