param location string
param storageAccountName string
param sku string
param kind string
param accessTier string
param blobName string

resource rStorageAccount 'Microsoft.Storage/storageAccounts@2020-08-01-preview' = {
  name: storageAccountName
  location: location
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    largeFileSharesState: 'Disabled'
    networkAcls: {
      resourceAccessRules: []
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: accessTier
  }
}

 resource blob 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
   name: 'default'
   parent: rStorageAccount
   properties: {
     containerDeleteRetentionPolicy: {
      allowPermanentDelete: true
      days: 7
      enabled: true
    }
        deleteRetentionPolicy: {
      allowPermanentDelete: true
      days: 7
      enabled: true
    }
   }
 }

resource rStorageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: blobName
  parent: blob
  properties: {
    publicAccess: 'Blob'
  }
}
