module "eks" {
  count = var.enable_eks ? 1 : 0

  source = "../../../platform-modules/modules/eks"

  name                         = local.name_prefix
  kubernetes_version           = var.kubernetes_version
  vpc_id                       = module.network.vpc_id
  private_subnet_ids           = local.eks_cluster_subnet_ids
  node_instance_types          = var.node_instance_types
  cluster_admin_principal_arns = var.eks_cluster_admin_principal_arns
  tags                         = local.common_tags
}
