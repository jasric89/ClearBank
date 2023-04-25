#!/bin/bash

CONTAINER_NAME=tfstate
ResourceGroupNames=("prod_terraform_backend" "stag_terraform_backend" "test_terraform_backend")
StorageAccNames=("prodterraformbackendsta" "stagterraformbackendsta" "testterraformbackendsta")
varfiles=("production.tfvars" "staging.tfvars" "testing.tfvars")
configfiles=("prodenv.conf" "stagingenv.conf" "testingenv.conf")
## Destroy Terraform Env
for acckey in ${!StorageAccNames[*]}; do 
# Get Account Key for Storage Account
ACCOUNT_KEY=$(az storage account keys list --resource-group ${ResourceGroupNames[$acckey]} --account-name ${StorageAccNames[$acckey]} --query '[0].value' -o tsv)
# Export the Account Key to an Environment Variable that will only be alive whilst this script is running.
export ARM_ACCESS_KEY=$ACCOUNT_KEY
# Run Terraform to now destroy the infrastructure.
terraform init -reconfigure -backend-config=${configfiles[$acckey]}
terraform destroy -var-file=${varfiles[$acckey]} -auto-approve
done
## Delete Terraform Backend Storage Accounts
for index in ${!ResourceGroupNames[*]}; do
  echo $index
  # Delete resource group
  az group delete --name ${ResourceGroupNames[$index]}
  # Delete storage account
  az storage account delete --resource-group ${ResourceGroupNames[$index]} --name ${StorageAccNames[$index]}
  # Delete blob container
  az storage container delete --name $CONTAINER_NAME --account-name ${StorageAccNames[$index]}
done
# Inform the user
echo Infrastructure deleted successfully!!