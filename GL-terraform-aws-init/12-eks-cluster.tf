resource "aws_eks_cluster" "eks-cluster-prod" {
  name     = "eks-cluster-prod"
  role_arn = aws_iam_role.eks-cluster-role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public-subnet-prod-b.id,
      aws_subnet.public-subnet-prod-a.id,
    ]
    security_group_ids = [aws_security_group.efs-eks-group.id]
  }
  depends_on = [aws_iam_role_policy_attachment.eks-cluster-role-AmazonEKSClusterPolicy]
}
