param location string
param aksClusterName string
param subnetId string
param aksNodeCount int
param aksVmSize string

resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-05-01' = {
  name: aksClusterName
  location: location
  properties: {
    dnsPrefix: aksClusterName
    agentPoolProfiles: [
      {
        name: 'nodepool1'
        count: aksNodeCount
        vmSize: aksVmSize
        osType: 'Linux'
        vnetSubnetID: subnetId
      }
    ]
    enableRBAC: true
    networkProfile: {
      networkPlugin: 'azure'
    }
  }
  tags: {
    owner: 'Venkata.Sai@neudesic.com'
  }
}

output aksClusterId string = aksCluster.id
