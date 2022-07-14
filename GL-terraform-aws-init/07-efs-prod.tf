resource "aws_efs_file_system" "efs-prod" {
  creation_token = "efs-prod"
  tags = {
    Name = "efs-prod"
  }
}

resource "aws_efs_mount_target" "efs-mount-target-a" {
  file_system_id  = aws_efs_file_system.efs-prod.id
  subnet_id       = aws_subnet.public-subnet-prod-a.id
  security_groups = [aws_security_group.efs-eks-group.id]
}

resource "aws_efs_mount_target" "efs-mount-target-b" {
  file_system_id  = aws_efs_file_system.efs-prod.id
  subnet_id       = aws_subnet.public-subnet-prod-b.id
  security_groups = [aws_security_group.efs-eks-group.id]
}