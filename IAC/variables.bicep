@description('Location for resources')
param location string = 'westus'

@description('Resource Group Name')
param rgName string = 'Python_POC'

@description('VNet and Subnet Name')
param vnetName string = 'venkat-vnet'
param subnetName string = 'venkat-subnet'

@description('AKS Cluster Name')
param aksClusterName string = 'venkat-aks'

@description('AKS Node Settings')
param aksNodeCount int = 2
param aksVmSize string = 'Standard_D2s_v3'
