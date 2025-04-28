param location string
param rgName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

output rgId string = resourceGroup.id
