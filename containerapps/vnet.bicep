

param vnetName string 
param env string 
param location string 
param ipAddressPrefixes array 
param subnets array

var vnet = toUpper('${vnetName}-${env}')
//var subnetNameFull = toUpper('SNET-${subnetName}-${env}')

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: vnet
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ipAddressPrefixes
    }
    subnets: [ for subnet in subnets :{
      name: '${subnet.name}'
      properties: {
        addressPrefixes: subnet.subnetIPPrefix
      }
        }]
  }
}

output vnetId string = virtualNetwork.id

