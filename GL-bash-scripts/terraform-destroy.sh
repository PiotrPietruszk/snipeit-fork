#! bin/bash
cd terraform-aws-init
terraform init
terraform destroy -auto-approve