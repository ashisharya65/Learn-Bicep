param location string = resourceGroup().location
param nameprefix string = 'storage'

var storageAccountName = '${nameprefix}${uniqueString(resourceGroup().id)}'
var storageAccountSku = 'Standard_LRS'
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01'={
  name: storageAccountName
  location: location
  sku:{
      name: storageAccountSku
  }
  kind: 'StorageV2'
  properties:{
    accessTier: 'Hot'
  }
}

resource aapServicePlan 'Microsoft.Web/serverfarms@2022-03-01'={
  name: 'toy-product-launch-plan-starter'
  location: location
  sku:{
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01'={
  name: 'toy-product-launch-65'
  location: location
  properties:{
    serverFarmId: aapServicePlan.id
    httpsOnly: true
  }
}



