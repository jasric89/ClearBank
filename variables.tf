## What Environment are we in? 
variable "environment" {
  description = "Environment of CIC Project"
  type        = string
}

## Resource Group Settings 
variable "resource_group_name" {
  description = "Name of Resource Group"
  type        = string
}

variable "rg_location" {
  description = "Location of Terraform Project"
  type        = string
}

## Service Bus Settings

variable "servicebusname" {
  description = "Service Bus Name"
  type        = string
}

variable "servicebusquenameone" {
  description = "Service Bus First Que Name"
  type        = string
}

variable "servicebusquenametwo" {
  description = "Service Bus Second Que Name"
}

variable "tag_map" {
  type        = map(any)
  description = "Map of Tag Values"
}

## AKS Settings

variable "aks_name" {
  type        = string
  description = "AKS Name"
}

variable "aks_nodepool" {
  type        = string
  description = "AKS Node Pool"
}

## Resource Lock

variable "resourcelockname" {
  description = "Resource Lock for Resource Group"
  type        = string
}