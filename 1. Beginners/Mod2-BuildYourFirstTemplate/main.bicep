param location string = 'westus3'
param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'
param appServiceAppName string = 'toylaunch${uniqueString(resourceGroup().id)}'
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3' : 'F1'
var appServicePlanName = 'toy-product-launch-plan'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01'={
  name: storageAccountName
  location: location
  sku:{
      name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties:{
    accessTier: 'Hot'
  }
}

resource aapServicePlan 'Microsoft.Web/serverfarms@2022-03-01'={
  name: appServicePlanName
  location: location
  sku:{
    name: appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01'={
  name: appServiceAppName
  location: location
  properties:{
    serverFarmId: aapServicePlan.id
    httpsOnly: true
  }
}


output appServiceAppURL string = 
