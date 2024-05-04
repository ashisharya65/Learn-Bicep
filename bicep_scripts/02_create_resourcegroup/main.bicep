param loc string = 'eastus'
targetScope = 'subscription'

resource azresourcegroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'bicepdemo-rg'
  location: loc
}
