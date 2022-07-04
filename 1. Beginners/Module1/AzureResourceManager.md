# What is Azure Resource Manager?

- Azure resource manager is the service that is used to deploy and manage resources in Azure
- We can use Azure resource manager to create, update and delete resources in your Azure subscription

## Terminology 

As you begin your cloud journey with Resource Manager, it's important to understand some terms and concepts:

- <b>Resource</b>: A manageable item that is available on the Azure platform. Virtual networks, virtual machines, storage accounts, web apps, and databases are examples of resources.

- <b>Resource group</b>: A logical container that holds related resources for an Azure solution. The resource group includes resources you want to manage as a group. Most Azure resources are contained in a resource group. You decide which resources belong in a resource group based on what makes the most sense for your solution.

- Subscription: A logical container and billing boundary for your resources and resource groups. Each Azure resource and resource group is associated with only one subscription.

- <b>Management group</b>: A logical container that you use to manage more than one subscription. You can define a hierarchy of management groups, subscriptions, resource groups, and resources to efficiently manage access, policies, and compliance through inheritance.

- <b>Azure Resource Manager template (ARM template)</b>: A template file that defines one or more resources to deploy to a resource group, subscription, management group, or tenant. You can use the template to deploy the resources in a consistent and repeatable way. There are two types of ARM template files: JSON and Bicep. This module focuses on the Bicep type of ARM template.