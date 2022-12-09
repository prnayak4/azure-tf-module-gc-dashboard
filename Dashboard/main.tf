 terraform {
  #backend "remote" {}
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
} 

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_subscription" "current" {}


data "azurerm_resources" "GuestConfiguration" {
  type = "microsoft.insights/workbooks"
  resource_group_name = "rg-avs-migrate-manage-kcl-westus2-001"
  required_tags     = {
    "hidden-title" = var.GuestConfigurationWorkbookTg

          }
}

resource "azurerm_portal_dashboard" "my-board" {
  name                = var.DashboardName
  resource_group_name = var.resourcegroupname
  location            = var.location
  dashboard_properties = templatefile ("KCNS-CLOUDOPS-DASHBOARD.json",
    {
     #gcconfigid    =  data.azurerm_resources.GuestConfiguration.resources[count.index].id
     gcconfigid    =  one (data.azurerm_resources.GuestConfiguration.resources.*.id)
      subid = data.azurerm_subscription.current.subscription_id
  }
  )
}