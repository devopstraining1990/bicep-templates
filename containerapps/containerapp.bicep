param environment_name string
param location string 

var logAnalyticsWorkspaceName = 'logs-${environment_name}'

resource logAnalyticsWorkspace'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: any({
    retentionInDays: 30
    features: {
      searchVersion: 1
    }
    sku: {
      name: 'PerGB2018'
    }
  })
}

resource environment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: environment_name
  location: location
  sku: {
    name: 'Consumption'
  }
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: reference(logAnalyticsWorkspace.id, '2022-10-01').customerId
        sharedKey: listKeys(logAnalyticsWorkspace.id, '2022-10-01').primarySharedKey
      }
    }
    /*vnetConfiguration: {
      internal: false
      infrastructureSubnetId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, infraSubnetName)
      dockerBridgeCidr: '10.2.0.1/16'
      platformReservedCidr: '10.1.0.0/16'
      platformReservedDnsIP: '10.1.0.2'
      runtimeSubnetId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, runtimeSubnetName)
    }*/
  }
}

resource nginxcontainerapp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'nginxcontainerapp'
  location: location
  properties: {
    managedEnvironmentId: environment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 80
      }
    }
    template: {
      containers: [
        {
          image: 'nginx'
          name: 'nginxcontainerapp'
          resources: {
            cpu: json('0.25')
            memory: '0.5Gi'
          }
        }
      ]
      scale: {
        minReplicas: 1
        maxReplicas: 1
      }
    }
  }
}
