resource "aws_security_group" "network-security-group" {
  name        = "security-group-prod"
  description = "Allows HTTP, SSH, MySQL ingress and all egress"
  vpc_id      = aws_vpc.vpc-prod.id
}

resource "aws_security_group_rule" "HTTP-ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.network-security-group.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allows HTTP inbound traffic"
}

resource "aws_security_group_rule" "SSH-ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.network-security-group.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allows SSH inbound traffic"
}

resource "aws_security_group_rule" "MySQL-ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.network-security-group.id
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allows MySQL inbound traffic"
}

resource "aws_security_group_rule" "All-egress" {
  type              = "egress"
  security_group_id = aws_security_group.network-security-group.id
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allows all outbound traffic"
}

resource "aws_security_group" "efs-eks-group" {
  name        = "efs-eks-group"
  description = "Allows NFS ingress"
  vpc_id      = aws_vpc.vpc-prod.id
}

resource "aws_security_group_rule" "NFS-ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.efs-eks-group.id
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
  description       = "Allows NFS ingress"
}