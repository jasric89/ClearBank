## What Environment are we in
environment = "Production"



## Resource Group Settings
resource_group_name = "ProductionEnv-UkSouth"
rg_location         = "UkSouth"

## Service Bus Settings

servicebusname       = "ProductionEnv-servicebus"
servicebusquenameone = "ProductionEnv-servicebusquename1"
servicebusquenametwo = "ProductionEnv-servicebusquename2"

tag_map = {
  costcenter = "productioncostcenter"
  product    = "productionproduct"
}

## AKS Settings

aks_name     = "productionenvaks"
aks_nodepool = "prodnodepool"

## Resource Lock Settings

resourcelockname = "ProductionEnv-resourcelock"

