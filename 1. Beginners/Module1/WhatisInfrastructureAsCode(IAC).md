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

    1. Provision new environments: One of the main benefits of cloud computing is the ability to scale. Infrastructure as code can help you scale to multiple instances of your application. These instances can help during times of increased load, or you can deploy them for users in other areas of the world. This agility also can be beneficial when you test your application, like during penetration testing, load testing, and bug testing. With a well-defined code base, you can dynamically provision these new environments in a consistent manner.

    2. Non-production environments: A common problem organizations face is differentiation between production and non-production environments. When you manually provision resources in separate environments, it's possible that the end configurations won't match. An example is when you deploy a new feature to a non-production environment that differs from the production environment. It's possible that the new feature won't work as expected in the production environment because of the differences between the two environments. Using infrastructure as code can help minimize these problems. You can use the same configuration files for each environment but supply different input parameters to create uniqueness.

    3. Disaster recovery: In some situations, infrastructure as code can be used as part of an organization's disaster recovery plan. For example, you might need to re-create your environment in another region because of a service outage. By using infrastructure as code, you can quickly provision a new instance to fail over to instead of manually deploying and reconfiguring everything.

- Better understand your cloud resources.

Infrastructure as code can help you better understand the state of your cloud resources:

   1. Audit trail: Changes to your infrastructure as code configurations are version-controlled in the same way as your application source code. These changes are tracked in your tooling, like with Git's version history. This audit trail means that you can review the details of each change, who made the change, and when the change was made.

   2. Documentation: You can use many infrastructure as code configurations to add metadata, like comments, which describe the purpose of the code in your configuration. If your organization already follows a code documentation process, consider adopting these same procedures with your infrastructure code.

   3. Unified system: Many times, when a developer is working on a new feature, they must make changes to application code and infrastructure code. By using a common system, your organization can better understand the relationship between your applications and your infrastructure.

   4. Better understanding of cloud infrastructure: When you use the Azure portal to provision resources, many of the processes are abstracted from view. Infrastructure as code can help provide a better understanding of how Azure works and how to troubleshoot issues that might arise. For example, when you create a virtual machine by using the Azure portal, some created resources are abstracted from view. Managed disks and network interface cards are deployed behind the scenes. When you deploy the same virtual machine by using infrastructure as code, you have complete control over all resources that are created.

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

