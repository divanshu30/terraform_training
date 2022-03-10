
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  subscription_id = "748eb2de-6ec3-4af2-b4d0-ec909d1934e9"
}
resource "azurerm_resource_group" "tf_rg" {
    name = "my_tf_rg"
    location = "Central India"
  
}
resource "azurerm_resource_group" "rg_divanshu_dev" {
    name = var.development
    location = "Central India"
  }

resource "azurerm_resource_group" "rg_divanshu_qa" {
    name = var.qualityAssurance
    location = "Central India"
  }

resource "azurerm_app_service_plan" "tf_app_service_plan" {
    name = "my_tf_appServicePlan"
    resource_group_name = azurerm_resource_group.tf_rg.name
    location = azurerm_resource_group.tf_rg.location
    sku {
      tier ="standar"
      size = "s1"
    }
}
resource "azurerm_storage_account" "storage01" {
    name ="storage001"
    resource_group_name = azurerm_resource_group.tf_rg.name
    location = azurerm_resource_group.tf_rg.location
    account_tier= "Standard"
    account_replication_type = "GRS"
  
}
resource "azurerm_app_service" "tf-appService" {
    name = "my-tf-appservice"
    resource_group_name = azurerm_resource_group.tf_rg.name
    location = azurerm_resource_group.tf_rg.location
    app_service_plan_id = azurerm_app_service_plan.tf_app_service_plan.id
  
}