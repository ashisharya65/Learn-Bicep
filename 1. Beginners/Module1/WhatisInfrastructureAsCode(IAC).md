# What is Infrastructure as Code (IAC)

- Infrastructure as Code is the process of automating your infrastructure provisioning
- It uses the descriptive coding language and versioning system that is similar to what is used for source code
- Infrastructure as code deployments are automated, consistent and repeatable
- Infrastructure as code can automate the deployments of your infrastructure resources, like virtual networks, virtual machines, applications, and storage.

## Why use IAC?

   Adopting an infrastructure as code approach offers many benefits to resource provisioning. With infrastructure as code, you can:

- Increase confidence in your deployments.

    1. Consistency -  Adopting an infrastructure as code approach helps your team follow well-established processes to deploy infrastructure. By following these processes, responsibility shifts from a small group of individuals to your automation process and tooling. Infrastructure as code helps reduce human error in resource provisioning and ensure consistent deployments.
    
    2. Secrets Management - Many solutions require secrets, like connection strings, encryption keys, client secrets, and certificates. In Azure, Azure Key Vault is the service that's used to securely store these secrets. Many infrastructure as code tools can integrate with Key Vault to access these secrets securely at deployment.

    3. Access Control - With infrastructure as code deployments, you have the option of using managed identities or service accounts to automate resource provisioning. This process ensures that cloud resources are modified only by these identities. It also helps prevent incorrect configurations deployed to production. If necessary, you can override this process by using an emergency access account (often called a break glass account) or by using the Azure Active Directory Privileged Identity Management feature.

    4. Avoid Configuration Drift -  Idempotence is a term that's frequently associated with infrastructure as code. When an operation is idempotent, it means that it provides the same result each time it's run. If you choose tooling that uses idempotent operations, you can avoid configuration drift.

- Manage multiple environments.
- Better understand your cloud resources.

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

