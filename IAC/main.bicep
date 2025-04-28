targetScope = 'subscription'

module variables './variables.bicep' = {
  name: 'variables'
}

module rgModule './modules/rg.bicep' = {
  name: 'resourceGroup'
  params: {
    location: variables.outputs.location
    rgName: variables.outputs.rgName
  }
}

module networkModule './modules/network.bicep' = {
  name: 'network'
  params: {
    location: variables.outputs.location
    rgName: variables.outputs.rgName
    vnetName: variables.outputs.vnetName
    subnetName: variables.outputs.subnetName
  }
  dependsOn: [
    rgModule
  ]
}

module aksModule './modules/aks.bicep' = {
  name: 'aks'
  params: {
    location: variables.outputs.location
    aksClusterName: variables.outputs.aksClusterName
    subnetId: networkModule.outputs.subnetId
    aksNodeCount: variables.outputs.aksNodeCount
    aksVmSize: variables.outputs.aksVmSize
  }
  dependsOn: [
    networkModule
  ]
}
