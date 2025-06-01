# Azure Tomcat Test Application

## Prerequisites
- Maven 3.x
- Java 8
- Azure CLI (for deployment)

## Configuration
Before deployment, create a `pom.properties` file in the project root:

```properties
azure.subscriptionId=your_subscription_id
azure.resourceGroup=your_resource_group
azure.appName=your_app_name
```

## Build and Deploy
1. Build the application:
```bash
mvn clean package
```

2. Deploy to Azure:
```bash
mvn azure-webapp:deploy
```

## Important Notes
- Ensure you're logged into Azure CLI before deployment
- First deployment creates the necessary Azure resources
- Subsequent deployments update the existing application# tomcat-azure-test
tomcat-azure-test
