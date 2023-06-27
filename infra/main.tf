@@ -1,26 +1,26 @@
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.6.0"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  name     = var.nome_resource_group
  location = "westus"
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asp-unip-croliveira"
  name                = var.nome_service_plan
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
@@ -32,7 +32,7 @@ resource "azurerm_service_plan" "appserviceplan" {

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "webapp-unip-croliveira"
  name                  = var.nome_webapp
  location              = "eastus"
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id