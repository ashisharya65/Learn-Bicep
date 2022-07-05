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


## Benefits

Resource Manager provides many benefits and capabilities related to infrastructure as code resource provisioning:

- You can deploy, manage, and monitor the resources in your solution as a group instead of individually.
- You can redeploy your solution throughout the development lifecycle and have confidence that your resources are deployed in a consistent state.
- You can manage your infrastructure through declarative templates instead of by using scripts.
- You can specify resource dependencies to ensure that resources are deployed in the correct order.


## Operations: Control plane and data plane

You can execute two types of operations in Azure: control plane operations and data plane operations. Use the control plane to manage the resources in your subscription. Use the data plane to access features that are exposed by a resource.

For example, you use a control plane operation to create a virtual machine, but you use a data plane operation to connect to the virtual machine by using Remote Desktop Protocol (RDP).


### Control Plane

- When you send a request from any of the Azure tools, APIs, or SDKs, Resource Manager receives, authenticates, and authorizes the request. Then, it sends the request to the Azure resource provider, which takes the requested action. Because all requests are handled through the same API, you see consistent results and capabilities in all the different tools that are available in Azure.

The following image shows the role Resource Manager plays in handling Azure requests:

<img src="https://docs.microsoft.com/en-us/learn/modules/includes/media/azure-resource-manager.png" alt="Resrouce Manager" style="text-align:center: 10px;" />


- All control plane operation requests are sent to a Resource Manager URL. For example, the create or update operation for virtual machines is a control plane operation. Here's the request URL for this operation:

        PUT https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Compute/virtualMachines/{virtualMachineName}?api-version=2020-12-01


- The control plane understands which resources need to be created and which resources already exist. Resource Manager understands the difference between these requests and won't create identical resources or delete existing resources, although there are ways to override this behavior.


### Data plane

- When starting a data plane operation, requests are sent to a specific endpoint in your Azure subscription. For example, the Detect Language operation in Cognitive Services is a data plane operation because the request URL is:


         POST https://eastus.api.cognitive.microsoft.com/text/analytics/v2.0/languages


- Resource Manager features like access control and locks don't always apply to data plane operations. For example, a user might not have permissions to manage a virtual machine by using the control plane, but the user can sign in to the operating system.


## What are ARM templates?

- ARM templates are files that define the infrastructure and configuration for your deployment. 
- When you write an ARM template, you take a declarative approach to your resource provisioning. 
- These templates describe each resource in the deployment, but they don't describe how to deploy the resources. 
- When you submit a template to Resource Manager for deployment, the control plane can deploy the defined resources in an organized and consistent manner. 

### Why use ARM templates?

There are many benefits to using ARM templates, both JSON and Bicep, for your resource provisioning:

- <b>Repeatable results</b>: ARM templates are idempotent, which means that you can repeatedly deploy the same template and get the same result. The template doesn't duplicate resources.

- <b>Orchestration</b>: When a template deployment is submitted to Resource Manager, the resources in the template are deployed in parallel. This process allows deployments to finish faster. Resource Manager orchestrates these deployments in the correct order if one resource depends on another.

- <b>Preview</b>: The what-if tool, available in PowerShell and Azure CLI, allows you to preview changes to your environment before template deployment. This tool will detail any creations, modification, and deletions that will be made by your template.

- <b>Testing and Validation</b>: You can use tools like the Bicep linter to check the quality of your templates before deployment. ARM templates submitted to Resource Manager are validated before the deployment process. This validation alerts you to any errors in your template before resource provisioning.

- <b>Modularity</b>: You can break up your templates into smaller components and link them together at deployment.

- <b>CI/CD integration</b>: Your ARM templates can be integrated into multiple CI/CD tools, like Azure DevOps and GitHub Actions. You can use these tools to version templates through source control and build release pipelines.

- <b>Extensibility</b>: With deployment scripts, you can run Bash or PowerShell scripts from within your ARM templates. These scripts perform tasks, like data plane operations, at deployment. Through extensibility, you can use a single ARM template to deploy a complete solution.


## JSON and Bicep templates

Two types of ARM templates are available for use today: JSON templates and Bicep templates. JavaScript Object Notation (JSON) is an open-standard file format that multiple languages can use. Bicep is a new domain-specific language that was recently developed for authoring ARM templates by using an easier syntax. You can use either template format for your ARM templates and resource deployments.


