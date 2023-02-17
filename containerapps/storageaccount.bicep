param storageAccountName string = 'staaccsuresh09'
param location string = 'eastus'
param sku string =  'Standard_LRS'
param kind string = 'StorageV2'
param accessTier string = 'Cool'
param allowBlobPublicAccess bool = false

resource symbolicname 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  sku: {
    name: sku
  }
  kind: kind
  identity: {
    type: 'SystemAssigned,UserAssigned'
    //userAssignedIdentities: {}
  }
  properties: {
    accessTier: accessTier
    allowBlobPublicAccess: allowBlobPublicAccess
    allowCrossTenantReplication: true
    //allowedCopyScope: 'PrivateLink'
    allowSharedKeyAccess: true
    isHnsEnabled: false
    isLocalUserEnabled: false
    isNfsV3Enabled: false
    isSftpEnabled: false
    keyPolicy: {
      keyExpirationPeriodInDays: 365
    }
    requireInfrastructureEncryption: false
    services: {
      blob: {
        enabled: true
        keyType: 'MMK'
      }
      file: {
        enabled: true
        keyType: 'MMK'
      }
      queue: {
        enabled: false
        //keyType: 'string'
      }
      table: {
        enabled: false
        //keyType: 'string'
      }
    }
    largeFileSharesState: 'Disabled'
    minimumTlsVersion: 'TLS1_2'
   
    sasPolicy: {
      expirationAction: 'Log'
      sasExpirationPeriod: '100'
    }
    supportsHttpsTrafficOnly: false 
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

param blobName string

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: blobName
  parent: symbolicname
  properties: {
    //defaultEncryptionScope: 'string'
    //denyEncryptionScopeOverride: bool
    enableNfsV3AllSquash: false
    enableNfsV3RootSquash: false
    immutableStorageWithVersioning: {
      enabled: true
    }
    metadata: {}
    publicAccess: 'Blob'
  }
}
