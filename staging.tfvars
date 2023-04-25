## What Environment are we in
environment = "staging"



## Resource Group Settings
resource_group_name = "StagingEnv-UkSouth"
rg_location         = "UkSouth"

## Service Bus Settings

servicebusname       = "StagingEnv-servicebus"
servicebusquenameone = "StagingEnv-servicebusquename1"
servicebusquenametwo = "StagingEnv-servicebusquename2"

tag_map = {
  costcenter = "stagingcostcenter"
  product    = "stagingproduct"
}

## AKS Settings

aks_name     = "stagingenvaks"
aks_nodepool = "stagenodepool"

## Resource Lock Settings

resourcelockname = "StagingEnv-resourcelock"


