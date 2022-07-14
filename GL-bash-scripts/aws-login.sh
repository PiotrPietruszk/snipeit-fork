#THIS SCRIPT IS TO BE USED 'INLINE' IN AZURE DEVOPS TO SIMPLIFY CREDENTIALS SECURITY
#! /bin/bash
aws configure set aws_access_key_id $(KEY_ID)
aws configure set aws_secret_access_key $(SECRET_ACCESS_KEY)
aws configure set default.region us-east-1
