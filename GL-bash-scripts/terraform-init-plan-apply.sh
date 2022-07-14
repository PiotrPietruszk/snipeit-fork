#! bin/bash
set -e
cd terraform-aws-init
terraform init
terraform validate
terraform apply -auto-approve