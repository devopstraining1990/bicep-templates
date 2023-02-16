param vnetName string
param location string 
param addressPrefixes string

resource vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefixes
      ]
    }
    subnets: [
      {
      name: 'default'
      properties: {
        addressPrefixes: [
            '10.0.0.0/28'
          ]}
        }
        ]
  }
}
