# What is Infrastructure as Code (IAC)

- Infrastructure as Code is the process of automating your infrastructure provisioning
- It uses the descriptive coding language and versioning system that is similar to what is used for source code
- Infrastructure as code deployments are automated, consistent and repeatable
- Infrastructure as code can automate the deployments of your infrastructure resources, like virtual networks, virtual machines, applications, and storage.

## Why use IAC?

## Imperative and declarative code

- With Imperative code, you execute sequence of commands in a specific order to reach an end configuration. This process defines what the code should accomplish, and it defines how to accomplish the task. In Azure, an imperative code approach is accomplished programmatically by using a scripting language like Bash or Azure PowerShell. 

    #### Azure CLI
        #!/usr/bin/env bash
        az group create \
            --name storage-resource-group \
            --location eastus

        az storage account create \
            --name mystorageaccount \
            --resource-group storage-resource-group \
            --kind StorageV2 \
            --access-tier Hot \
            --https-only true

- With Declarative code, you specify only the end configuration. The code doesn't define how to accomplish the task.In Azure, a declarative code approach is accomplished by using templates. Many types of templates are available to use, including:
  
    * JSON
    * Bicep
    * Ansible, by RedHat
    * Terraform, by HashiCorp

    <br/>

    #### Bicep Template that configures a storage account: 

        resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
        name: 'mystorageaccount'
        location: 'eastus'
        sku: {
            name: 'Standard_LRS'
        }
        kind: 'StorageV2'
        properties: {
            accessTier: 'Hot'
            supportsHttpsTrafficOnly: true
        }
        }

    You might notice that the Bicep template doesn't specify how to deploy the storage account. It specifies only what the storage account needs to look like. The actual steps that are executed behind the scenes to create this storage account or to update it to match the specification are left for Azure to decide.

