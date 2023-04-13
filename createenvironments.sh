#!/bin/bash

CONTAINER_NAME=tfstate
ResourceGroupNames=("prod_terraform_backend" "stag_terraform_backend" "test_terraform_backend")
StorageAccNames=("prodterraformbackendsta" "stagterraformbackendsta" "testterraformbackendsta")
varfiles=("production.tfvars" "staging.tfvars" "testing.tfvars")
configfiles=("prodenv.conf" "stagingenv.conf" "testingenv.conf")
for index in ${!ResourceGroupNames[*]}; do
  echo $index
  # Create resource group
  az group create --name ${ResourceGroupNames[$index]} --location uksouth
  # Create storage account
  az storage account create --resource-group ${ResourceGroupNames[$index]} --name ${StorageAccNames[$index]} --sku Standard_LRS --encryption-services blob
  # Create blob container
  az storage container create --name $CONTAINER_NAME --account-name ${StorageAccNames[$index]}
done

for acckey in ${!StorageAccNames[*]}; do
# Get Account Key for Storage Account
ACCOUNT_KEY=$(az storage account keys list --resource-group ${ResourceGroupNames[$acckey]} --account-name ${StorageAccNames[$acckey]} --query '[0].value' -o tsv)
# Export the Account Key to an Environment Variable that will only be alive whilst this script is running.
export ARM_ACCESS_KEY=$ACCOUNT_KEY
# Run Terraform to now create the infrastructure.
terraform init -reconfigure -backend-config=${configfiles[$acckey]}
terraform apply -var-file=${varfiles[$acckey]} -auto-approve
# Inform the user
echo Infrastructure created successfully!!
done
