/*module cdnProfile 'cdnProfile.bicep' = {
    name: 'cdnProfile'
    params: {
        location: 'eastus'
        cdnProfileName: 'cdnDemo'
        cdnSKU: 'Standard_Microsoft'
    }
}

module storageAccount 'storageAccount.bicep' = {
    name: 'storageAccount'
    params: {
        location: 'eastus'
        storageAccountName: 'stgplaygund001054'
        sku: 'Standard_LRS'
        kind: 'StorageV2'
        accessTier: 'Cool'
        blobName: 'container001'
    }
}*/

module storageAccount 'vnet.bicep' = {
    name: 'vnet'
    params: {
        vnetName: 'vnet01'
        location: 'eastus'
        addressPrefixes: '10.0.0.0/16'
    }
}
