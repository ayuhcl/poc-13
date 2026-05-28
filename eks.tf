module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  subnets = module.vpc.public_subnets
  vpc_id  = module.vpc.vpc_id

  node_groups = {
    example = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1

      instance_types = ["t3.micro"]
    }
  }
}
