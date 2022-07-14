#Issue certificate needed for OIDC access
data "tls_certificate" "eks" {
  url = aws_eks_cluster.eks-cluster-prod.identity[0].oidc[0].issuer
}

#Create AWS OIDC provider 
resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks-cluster-prod.identity[0].oidc[0].issuer
}

#Create OIDC policy to attach to a role
data "aws_iam_policy_document" "oidc-policy-efs" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:default:snipeit"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

#Create oidc access role and attach OIDC policy
resource "aws_iam_role" "oidc-default" {
  assume_role_policy = data.aws_iam_policy_document.oidc-policy-efs.json
  name               = "oidc-default"
}

#Attach EFS access policy to oicd role - needed to create Storage Classes, 
#Persistent Volumes and Persistent Volume claims that use AWS
#this role is attachedto a service account in /k8s/00-service-account.yaml
resource "aws_iam_role_policy_attachment" "EFSPolicy-attach" {
  role       = aws_iam_role.oidc-default.name
  policy_arn = aws_iam_policy.eks-EFSPolicy.arn
}
