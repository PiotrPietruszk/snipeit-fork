resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster-prod.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks-node-role.arn

  subnet_ids = [
    aws_subnet.public-subnet-prod-a.id,
    aws_subnet.public-subnet-prod-b.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-node-role-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-node-role-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-node-role-AmazonEC2ContainerRegistryReadOnly,
  ]
}