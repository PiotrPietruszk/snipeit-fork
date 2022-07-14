# resource "aws_key_pair" "SnipeIt-server-key" {
#   key_name   = "SnipeIT-server"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCU15cH8N8lXx6SoGr6v03H2t+AS8CnTQ0pY9EsUQt2YQ2Twf/GHQm91kj7fi7iL+qgL6/oSV96qazV8wOPtHnlSqldpIgMX3ei60DvcmBaP017H+qjaHEVrVr75lCmk5XuLdO6WsPl/uYVYbkaiCl2f4DQFVExKdSlgMbmW2L/cbeq5mYnrBSLddnndifQ0c+TfE6reJ17p0IjpzXvDlcGqJVf5kmU7EqnIAXgMmekSMSdk9qW48gA7qpkaej+3cUBSYL9oeXiBqMmZhpJEoS7+EEWY/xECWkriWKmWJhZOYCbC3vUn/ksNDTNpax7jnM8WcA3afH++xOn5XCSGtYT"

# }
# module "ec2_intance" {
#   source = "terraform-aws-modules/ec2-instance/aws"

#   name                        = "SnipeIT-server"
#   ami                         = "ami-0cff7528ff583bf9a"
#   instance_type               = "t3.medium"
#   vpc_security_group_ids      = [aws_security_group.network-security-group.id]
#   subnet_id                   = aws_subnet.public-subnet-prod-a.id
#   associate_public_ip_address = true
#   key_name                    = "SnipeIT-server"
# }