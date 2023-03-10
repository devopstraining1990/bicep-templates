
param location string = 'eastus'
param cdnProfileName string = 'cdnDemo'
param cdnSKU string = 'Standard_Microsoft'

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


//param cdnendpointName string

//resource cdnendpoint 'Microsoft.Cdn/profiles/endpoints@2022-11-01-preview' = {
//  name: cdnendpointName
//  location: location
//  tags: {
//    tagName1: 'tagValue1'
//    tagName2: 'tagValue2'
//  }
//  //parent: resourceSymbolicName
//  properties: {
//    contentTypesToCompress: [
//      'string'
//    ]
//    defaultOriginGroup: {
//      id: 'string'
//    }
//    deliveryPolicy: {
//      description: 'string'
//      rules: [
//        {
//          actions: [
//            {
//              name: 'string'
//              // For remaining properties, see DeliveryRuleActionAutoGenerated objects
//            }
//          ]
//          conditions: [
//            {
//              name: 'string'
//              // For remaining properties, see DeliveryRuleCondition objects
//            }
//          ]
//          name: 'string'
//          order: int
//        }
//      ]
//    }
//    geoFilters: [
//      {
//        action: 'string'
//        countryCodes: [
//          'string'
//        ]
//        relativePath: 'string'
//      }
//    ]
//    isCompressionEnabled: bool
//    isHttpAllowed: bool
//    isHttpsAllowed: bool
//    optimizationType: 'string'
//    originGroups: [
//      {
//        name: 'string'
//        properties: {
//          healthProbeSettings: {
//            probeIntervalInSeconds: int
//            probePath: 'string'
//            probeProtocol: 'string'
//            probeRequestType: 'string'
//          }
//          origins: [
//            {
//              id: 'string'
//            }
//          ]
//          responseBasedOriginErrorDetectionSettings: {
//            httpErrorRanges: [
//              {
//                begin: int
//                end: int
//              }
//            ]
//            responseBasedDetectedErrorTypes: 'string'
//            responseBasedFailoverThresholdPercentage: int
//          }
//          trafficRestorationTimeToHealedOrNewEndpointsInMinutes: int
//        }
//      }
//    ]
//    originHostHeader: 'string'
//    originPath: 'string'
//    origins: [
//      {
//        name: 'string'
//        properties: {
//          enabled: bool
//          hostName: 'string'
//          httpPort: int
//          httpsPort: int
//          originHostHeader: 'string'
//          priority: int
//          privateLinkAlias: 'string'
//          privateLinkApprovalMessage: 'string'
//          privateLinkLocation: 'string'
//          privateLinkResourceId: 'string'
//          weight: int
//        }
//      }
//    ]
//    probePath: 'string'
//    queryStringCachingBehavior: 'string'
//    urlSigningKeys: [
//      {
//        keyId: 'string'
//        keySourceParameters: {
//          resourceGroupName: 'string'
//          secretName: 'string'
//          secretVersion: 'string'
//          subscriptionId: 'string'
//          typeName: 'KeyVaultSigningKeyParameters'
//          vaultName: 'string'
//        }
//      }
//    ]
//    webApplicationFirewallPolicyLink: {
//      id: 'string'
//    }
//  }
//}
