variable "aws_region" {
  description = "AWS Region where the shared lab infrastructure is provisioned."
  type        = string
  default     = "eu-north-1"
}

variable "allowed_account_ids" {
  description = "AWS account ID where the shared lab infrastructure is allowed to be provisioned."
  type        = string
}

variable "workspace_path" {
  description = "Local workspace path recorded as a tag to make lab resources traceable to the checkout that created them."
  type        = string
}

variable "project_name" {
  description = "Project name used in resource names and tags."
  type        = string
  default     = "solab"
}

variable "environment" {
  description = "Infrastructure environment name used for shared AWS resource names and tags. Kubernetes application environments are introduced separately in platform-config."
  type        = string
  default     = "shared"
}

variable "vpc_cidr" {
  description = "Primary CIDR block assigned to the shared lab VPC. Keep this range small and aligned with the agreed IP plan."
  type        = string
  default     = "10.100.0.0/24"
}

variable "secondary_cidr_blocks" {
  description = "Optional planned, non-overlapping VPC CIDR blocks. Use this when EKS needs subnet capacity outside the primary VPC CIDR."
  type        = list(string)
  default     = []
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks assigned to the public subnets."
  type        = list(string)
  default     = ["10.100.0.0/27", "10.100.0.32/27"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks assigned to platform private subnets from the primary VPC CIDR."
  type        = list(string)
  default     = ["10.100.0.64/27", "10.100.0.96/27"]
}

variable "eks_private_subnet_cidrs" {
  description = "Optional EKS private subnet CIDRs, usually carved from secondary_cidr_blocks for larger pod/node capacity."
  type        = list(string)
  default     = []
}

variable "single_nat_gateway" {
  description = "Create one shared NAT Gateway for the lab. Set false for one NAT Gateway per Availability Zone."
  type        = bool
  default     = true
}

variable "enable_eks" {
  description = "Create the Lab 04 EKS cluster."
  type        = bool
  default     = false
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.36"
}

variable "node_instance_types" {
  description = "Instance types for EKS managed nodes."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_cluster_admin_principal_arns" {
  description = "Additional IAM principal ARNs granted Kubernetes cluster admin access through EKS access entries. Add the AWS SSO role ARN used in the console here."
  type        = list(string)
  default     = []
}
