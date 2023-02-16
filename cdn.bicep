param location string
param cdnProfileName string 
param cdnSKU string 

resource symbolicname 'Microsoft.Cdn/profiles@2022-11-01-preview' = {
  name: cdnProfileName
  location: location
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  sku: {
    name: cdnSKU
  }
  identity: {
    type: 'systemAssigned'
    //userAssignedIdentities: {}
  }
  properties: {
    extendedProperties: {}
    originResponseTimeoutSeconds: 16
  }
}
