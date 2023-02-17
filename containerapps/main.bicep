
targetScope = 'subscription' 

param resourceGroupName string = 'RG-TEST'
param location string = 'eastus'

param vnetName string 
param env string 
param ipAddressPrefixes array 
param subnets array

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
}

module VNETD 'vnet.bicep' = {
name: 'vnet-deployment'
scope: rg
params: {
 ipAddressPrefixes: ipAddressPrefixes
 env: env
 location: location
 vnetName: vnetName
 subnets: subnets
}
}
