locals {
  name_prefix        = "${var.project_name}-${var.environment}"
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)

  private_subnet_cidrs        = concat(var.private_subnet_cidrs, var.eks_private_subnet_cidrs)
  platform_private_subnet_ids = slice(module.network.private_subnet_ids, 0, length(var.private_subnet_cidrs))
  eks_private_subnet_ids      = slice(module.network.private_subnet_ids, length(var.private_subnet_cidrs), length(module.network.private_subnet_ids))
  eks_cluster_subnet_ids      = length(local.eks_private_subnet_ids) > 0 ? local.eks_private_subnet_ids : local.platform_private_subnet_ids

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
    Repository  = "platform-live"
    Workspace   = var.workspace_path
  }
}
