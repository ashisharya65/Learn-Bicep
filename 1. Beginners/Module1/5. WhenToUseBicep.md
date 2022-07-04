# When to use Bicep?

There are many reasons to choose Bicep as the main tool set for your infrastructure as code deployments. For Azure deployments, Bicep has some advantages, but Bicep doesn't work as a language for other cloud providers.

## When is Bicep the right tool?

If you're using Azure as your cloud platform, consider these advantages of using Bicep:

- <b>Azure-native</b>: With Bicep, you're using a language that is native to Azure. When new Azure resources are released or updated, Bicep will support those features on day one. When using other third-party tools, it might take some time for new features to be defined in the tool set.

- <b>Azure integration</b>: ARM templates, both JSON and Bicep, are fully integrated within the Azure platform. With Resource Manager-based deployments, you can monitor the progress of your deployment in the Azure portal.

- <b>Azure support</b>: Bicep is a fully supported product with Microsoft Support.

- <b>No state management</b>: Bicep deployments compare the current state of your Azure resources with the state that you define in the template. You don't need to keep your resource state information somewhere else, like in a storage account. Azure automatically keeps track of this state for you.

- <b>Easy transition from JSON</b>: If you're already using ARM JSON templates as your declarative template language, it isn't a difficult process to transition to using Bicep. You can use the Bicep CLI to decompile any ARM template into a Bicep template by using the bicep decompile command.

## When is Bicep not the right tool?

Some situations might call for another tool set. Consider the following reasons not to use Bicep as your main tool set:

- <b>Existing tool set</b>: When you are determining when to use Bicep, the first question to ask is, "Does my organization already have a tool set in use?" Many tooling options are available that can be used for infrastructure as code-based resource provisioning. Sometimes, it makes sense to use existing financial and knowledge investments when you consider adopting a new process.

- <b>Multi-cloud</b>: If your organization uses multiple cloud providers to host its infrastructure, Bicep might not be the right tool. Other cloud providers don't support Bicep as a template language. Open-source tools like Terraform can be used for multi-cloud deployments, including deployments to Azure.

