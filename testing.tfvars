## What Environment are we in
environment = "testing"

## Resource Group Settings
resource_group_name = "TestingEnv-UkSouth"
rg_location         = "UkSouth"

## Service Bus Settings

servicebusname       = "TestingEnv-servicebus"
servicebusquenameone = "TestingEnv-servicebusquename1"
servicebusquenametwo = "TestingEnv-servicebusquename2"

tag_map = {
  costcenter = "testingcostcenter"
  product    = "testingproduct"
}

## AKS Settings

aks_name     = "testingenvaks"
aks_nodepool = "testnodepool"

## Resource Lock Settings

resourcelockname = "TestingEnv-resourcelock"


