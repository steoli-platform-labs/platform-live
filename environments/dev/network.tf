module "network" {
  source = "../../../platform-modules/modules/core"

  prefix = local.name_prefix

  create_vpc                  = true
  create_operational_baseline = false

  vpc_name              = "${local.name_prefix}-vpc"
  vpc_cidr              = var.vpc_cidr
  secondary_cidr_blocks = var.secondary_cidr_blocks
  availability_zones    = local.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = local.private_subnet_cidrs

  cluster_name              = "${local.name_prefix}-eks"
  enable_single_nat_gateway = var.single_nat_gateway

  common_tags = local.common_tags
}
